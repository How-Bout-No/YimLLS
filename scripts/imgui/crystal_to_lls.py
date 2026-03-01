#!/usr/bin/env python3


# Thanks Claude
"""
Convert enum text to LuaLS @field annotations.

Input format (each entry is a name=value pair, optionally followed by a description):
    None = 0
    AlwaysClamp = 16
    Clamp value to min/max bounds...
    Logarithmic = 32
    ...

Output format:
    ---@field None            integer = 0
    ---@field AlwaysClamp     integer = 1 << 4 // Clamp value to min/max...
"""

import re
import sys
import math

do_bit_conversion = True


def bit_notation(n: int) -> str:
    """Return '1 << k' if n is a nonzero power of two, otherwise its decimal string."""
    if (not do_bit_conversion):
        return n

    if n > 0 and (n & (n - 1)) == 0:
        k = int(math.log2(n))

        return f"1 << {k}"
    return str(n)


def parse_entries(text: str) -> list[tuple[str, int, str]]:
    """
    Parse the input text into a list of (name, value, description) tuples.
    Description lines are any lines between one 'Name = N' line and the next.
    """

    field_re = re.compile(r"^(\w+)\s*=\s*(-?\d+)\s*$")

    entries: list[tuple[str, int, str]] = []

    current: tuple[str, int] | None = None

    desc_lines: list[str] = []

    for raw_line in text.splitlines():
        line = raw_line.strip()

        if not line:
            continue

        m = field_re.match(line)

        if m:
            # Flush previous entry

            if current is not None:
                entries.append((*current, " ".join(desc_lines)))

            current = (m.group(1), int(m.group(2)))

            desc_lines = []

        else:
            if current is not None:
                desc_lines.append(line)

            # Lines before the first field are silently ignored

    # Flush the last entry

    if current is not None:
        entries.append((*current, " ".join(desc_lines)))

    return entries


def format_annotations(entries: list[tuple[str, int, str]]) -> str:
    """Render entries as aligned LuaLS @field annotation lines."""

    if not entries:
        return ""

    max_name_len = max(len(name) for name, _, _ in entries)

    lines: list[str] = []

    for name, value, desc in entries:
        bit_not = bit_notation(value)

        padding = " " * (max_name_len - len(name))

        line = f"---@field {name}{padding} integer = {bit_not}"

        if desc:
            line += f",  // {desc}"
        lines.append(line)

    return "\n".join(lines)


def main() -> None:

    if len(sys.argv) > 1:
        # Read from file path given as argument

        path = sys.argv[1]

        with open(path, "r", encoding="utf-8") as f:
            text = f.read()

    else:
        # Read from stdin

        print(
            "Paste your wiki text, then press Ctrl+D (or Ctrl+Z on Windows):",
            file=sys.stderr,
        )

        text = sys.stdin.read()

    entries = parse_entries(text)

    if not entries:
        print(
            "No entries found. Make sure lines follow the 'Name = Number' pattern.",
            file=sys.stderr,
        )

        sys.exit(1)

    print(format_annotations(entries))


if __name__ == "__main__":
    main()
