# Update scripts

Run script from `YimMenu/scripts/imgui` directory.

Select and copy information from https://oprypin.github.io/crystal-imgui/ImGui.html

Example `input.txt`:
```
# https://oprypin.github.io/crystal-imgui/ImGui/ImGuiHoveredFlags.html#enum-members

None = 0
Return true if directly over the item/window, not obstructed by another window, not obstructed by an active popup or modal blocking inputs under them.

ChildWindows = 1
IsWindowHovered() only: Return true if any children of the window is hovered

RootWindow = 2
IsWindowHovered() only: Test from root window (top most parent of the current hierarchy)

AnyWindow = 4
IsWindowHovered() only: Return true if any window is hovered

NoPopupHierarchy = 8
IsWindowHovered() only: Do not consider popup hierarchy (do not treat popup emitter as parent of popup) (when used with _ChildWindows or _RootWindow)

AllowWhenBlockedByPopup = 32
Return true even if a popup window is normally blocking access to this item/window

AllowWhenBlockedByActiveItem = 128
Return true even if an active item is blocking access to this item/window. Useful for Drag and Drop patterns.

AllowWhenOverlappedByItem = 256
IsItemHovered() only: Return true even if the item uses AllowOverlap mode and is overlapped by another hoverable item.

AllowWhenOverlappedByWindow = 512
IsItemHovered() only: Return true even if the position is obstructed or overlapped by another window.

AllowWhenDisabled = 1024
IsItemHovered() only: Return true even if the item is disabled
```

Output of `convert_bindings.py`:
```
{
    None = 0x00000000,
    ChildWindows = 0x00000001,
    RootWindow = 0x00000002,
    AnyWindow = 0x00000004,
    NoPopupHierarchy = 0x00000008,
    AllowWhenBlockedByPopup = 0x00000020,
    AllowWhenBlockedByActiveItem = 0x00000080,
    AllowWhenOverlappedByItem = 0x00000100,
    AllowWhenOverlappedByWindow = 0x00000200,
    AllowWhenDisabled = 0x00000400,
}
```