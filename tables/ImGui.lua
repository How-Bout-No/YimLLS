---@meta

---@class ImVec2
---@field x float
---@field y float
ImVec2 = {}

---@class ImDrawList : userdata

---@class ImGuiStyle: userdata
---@field WindowRounding float
---@field ChildRounding float
---@field GrabRounding float
---@field ScrollbarRounding float
---@field ScrollbarSize float
---@field TabRounding float
---@field WindowBorderSize float
---@field WindowPadding ImVec2
---@field FramePadding ImVec2
---@field FrameRounding float
---@field FrameBorderSize float
---@field PopupBorderSize float
---@field ItemSpacing ImVec2
ImGuiStyle = {}

---@class ImGuiTableFlags
---@field None                       integer = 0,
---@field Resizable                  integer = 1 << 0,   // Enable resizing columns.
---@field Reorderable                integer = 1 << 1,   // Enable reordering columns in header row (need calling TableSetupColumn() + TableHeadersRow() to display headers)
---@field Hideable                   integer = 1 << 2,   // Enable hiding/disabling columns in context menu.
---@field Sortable                   integer = 1 << 3,   // Enable sorting. Call TableGetSortSpecs() to obtain sort specs. Also see ImGuiTableFlags_SortMulti and ImGuiTableFlags_SortTristate.
---@field NoSavedSettings            integer = 1 << 4,   // Disable persisting columns order, width and sort settings in the .ini file.
---@field ContextMenuInBody          integer = 1 << 5,   // Right-click on columns body/contents will display table context menu. By default it is available in TableHeadersRow().
---@field RowBg                      integer = 1 << 6,   // Set each RowBg color with ImGuiCol_TableRowBg or ImGuiCol_TableRowBgAlt (equivalent of calling TableSetBgColor with ImGuiTableBgFlags_RowBg0 on each row manually)
---@field BordersInnerH              integer = 1 << 7,   // Draw horizontal borders between rows.
---@field BordersOuterH              integer = 1 << 8,   // Draw horizontal borders at the top and bottom.
---@field BordersInnerV              integer = 1 << 9,   // Draw vertical borders between columns.
---@field BordersOuterV              integer = 1 << 10,  // Draw vertical borders on the left and right sides.
---@field BordersH                   integer = ImGuiTableFlags_BordersInnerH | ImGuiTableFlags_BordersOuterH, // Draw horizontal borders.
---@field BordersV                   integer = ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersOuterV, // Draw vertical borders.
---@field BordersInner               integer = ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersInnerH, // Draw inner borders.
---@field BordersOuter               integer = ImGuiTableFlags_BordersOuterV | ImGuiTableFlags_BordersOuterH, // Draw outer borders.
---@field Borders                    integer = ImGuiTableFlags_BordersInner | ImGuiTableFlags_BordersOuter,   // Draw all borders.
---@field NoBordersInBody            integer = 1 << 11,  // [ALPHA] Disable vertical borders in columns Body (borders will always appear in Headers). -> May move to style
---@field NoBordersInBodyUntilResize integer = 1 << 12,  // [ALPHA] Disable vertical borders in columns Body until hovered for resize (borders will always appear in Headers). -> May move to style Policy (read above for defaults)
---@field SizingFixedFit             integer = 1 << 13,  // Columns default to _WidthFixed or _WidthAuto (if resizable or not resizable), matching contents width.
---@field SizingFixedSame            integer = 2 << 13,  // Columns default to _WidthFixed or _WidthAuto (if resizable or not resizable), matching the maximum contents width of all columns. Implicitly enable ImGuiTableFlags_NoKeepColumnsVisible.
---@field SizingStretchProp          integer = 3 << 13,  // Columns default to _WidthStretch with default weights proportional to each columns contents widths.
---@field SizingStretchSame          integer = 4 << 13,  // Columns default to _WidthStretch with default weights all equal, unless overridden by TableSetupColumn(). Extra Options
---@field NoHostExtendX              integer = 1 << 16,  // Make outer width auto-fit to columns, overriding outer_size.x value. Only available when ScrollX/ScrollY are disabled and Stretch columns are not used.
---@field NoHostExtendY              integer = 1 << 17,  // Make outer height stop exactly at outer_size.y (prevent auto-extending table past the limit). Only available when ScrollX/ScrollY are disabled. Data below the limit will be clipped and not visible.
---@field NoKeepColumnsVisible       integer = 1 << 18,  // Disable keeping column always minimally visible when ScrollX is off and table gets too small. Not recommended if columns are resizable.
---@field PreciseWidths              integer = 1 << 19,  // Disable distributing remainder width to stretched columns (width allocation on a 100-wide table with 3 columns: Without this flag: 33,33,34. With this flag: 33,33,33). With larger number of columns, resizing will appear to be less smooth.
---@field NoClip                     integer = 1 << 20,  // Disable clipping rectangle for every individual columns (reduce draw command count, items will be able to overflow into other columns). Generally incompatible with TableSetupScrollFreeze().
---@field PadOuterX                  integer = 1 << 21,  // Default if BordersOuterV is on. Enable outermost padding. Generally desirable if you have headers.
---@field NoPadOuterX                integer = 1 << 22,  // Default if BordersOuterV is off. Disable outermost padding.
---@field NoPadInnerX                integer = 1 << 23,  // Disable inner padding between columns (double inner padding if BordersOuterV is on, single inner padding if BordersOuterV is off).
---@field ScrollX                    integer = 1 << 24,  // Enable horizontal scrolling. Require 'outer_size' parameter of BeginTable() to specify the container size. Changes default sizing policy. Because this creates a child window, ScrollY is currently generally recommended when using ScrollX.
---@field ScrollY                    integer = 1 << 25,  // Enable vertical scrolling. Require 'outer_size' parameter of BeginTable() to specify the container size.
---@field SortMulti                  integer = 1 << 26,  // Hold shift when clicking headers to sort on multiple column. TableGetSortSpecs() may return specs where (SpecsCount > 1).
---@field SortTristate               integer = 1 << 27,  // Allow no sorting, disable default sorting. TableGetSortSpecs() may return specs where (SpecsCount == 0).
---@field HighlightHoveredColumn     integer = 1 << 28,  // Highlight column headers when hovered (may evolve into a fuller highlight)
ImGuiTableFlags = {}

---@class ImGuiTableColumnFlags
---@field None                  integer = 0,
---@field Disabled              integer 1 << 0,   // Overriding/master disable flag: hide column, won't show in context menu (unlike calling TableSetColumnEnabled() which manipulates the user accessible state)
---@field DefaultHide           integer 1 << 1,   // Default as a hidden/disabled column.
---@field DefaultSort           integer 1 << 2,   // Default as a sorting column.
---@field WidthStretch          integer 1 << 3,   // Column will stretch. Preferable with horizontal scrolling disabled (default if table sizing policy is _SizingStretchSame or _SizingStretchProp).
---@field WidthFixed            integer 1 << 4,   // Column will not stretch. Preferable with horizontal scrolling enabled (default if table sizing policy is _SizingFixedFit and table is resizable).
---@field NoResize              integer 1 << 5,   // Disable manual resizing.
---@field NoReorder             integer 1 << 6,   // Disable manual reordering this column, this will also prevent other columns from crossing over this column.
---@field NoHide                integer 1 << 7,   // Disable ability to hide/disable this column.
---@field NoClip                integer 1 << 8,   // Disable clipping for this column (all NoClip columns will render in a same draw command).
---@field NoSort                integer 1 << 9,   // Disable ability to sort on this field (even if ImGuiTableFlags_Sortable is set on the table).
---@field NoSortAscending       integer 1 << 10,  // Disable ability to sort in the ascending direction.
---@field NoSortDescending      integer 1 << 11,  // Disable ability to sort in the descending direction.
---@field NoHeaderLabel         integer 1 << 12,  // TableHeadersRow() will submit an empty label for this column. Convenient for some small columns. Name will still appear in context menu or in angled headers. You may append into this cell by calling TableSetColumnIndex() right after the TableHeadersRow() call.
---@field NoHeaderWidth         integer 1 << 13,  // Disable header text width contribution to automatic column width.
---@field PreferSortAscending   integer 1 << 14,  // Make the initial sort direction Ascending when first sorting on this column (default).
---@field PreferSortDescending  integer 1 << 15,  // Make the initial sort direction Descending when first sorting on this column.
---@field IndentEnable          integer 1 << 16,  // Use current Indent value when entering cell (default for column 0).
---@field IndentDisable         integer 1 << 17,  // Ignore current Indent value when entering cell (default for columns > 0). Indentation changes _within_ the cell will still be honored.
---@field AngledHeader          integer 1 << 18,  // TableHeadersRow() will submit an angled header row for this column. Note this will add an extra row.
ImGuiTableColumnFlags = {}

---@alias ImGuiTableSortSpecs any

---@class ImGuiStyleVar
---@field Alpha                       integer = 0,  // float Alpha
---@field DisabledAlpha               integer = 1,  // float DisabledAlpha
---@field WindowPadding               integer = 2,  // ImVec2 WindowPadding
---@field WindowRounding              integer = 3,  // float WindowRounding
---@field WindowBorderSize            integer = 4,  // float WindowBorderSize
---@field WindowMinSize               integer = 5,  // ImVec2 WindowMinSize
---@field WindowTitleAlign            integer = 6,  // ImVec2 WindowTitleAlign
---@field ChildRounding               integer = 7,  // float ChildRounding
---@field ChildBorderSize             integer = 8,  // float ChildBorderSize
---@field PopupRounding               integer = 9,  // float PopupRounding
---@field PopupBorderSize             integer = 10,  // float PopupBorderSize
---@field FramePadding                integer = 11,  // ImVec2 FramePadding
---@field FrameRounding               integer = 12,  // float FrameRounding
---@field FrameBorderSize             integer = 13,  // float FrameBorderSize
---@field ItemSpacing                 integer = 14,  // ImVec2 ItemSpacing
---@field ItemInnerSpacing            integer = 15,  // ImVec2 ItemInnerSpacing
---@field IndentSpacing               integer = 16,  // float IndentSpacing
---@field CellPadding                 integer = 17,  // ImVec2 CellPadding
---@field ScrollbarSize               integer = 18,  // float ScrollbarSize
---@field ScrollbarRounding           integer = 19,  // float ScrollbarRounding
---@field GrabMinSize                 integer = 20,  // float GrabMinSize
---@field GrabRounding                integer = 21,  // float GrabRounding
---@field TabRounding                 integer = 22,  // float TabRounding
---@field TabBorderSize               integer = 23,  // float TabBorderSize
---@field TabBarBorderSize            integer = 24,  // float TabBarBorderSize
---@field TableAngledHeadersAngle     integer = 25,  // float TableAngledHeadersAngle
---@field TableAngledHeadersTextAlign integer = 26,  // ImVec2 TableAngledHeadersTextAlign
---@field ButtonTextAlign             integer = 27,  // ImVec2 ButtonTextAlign
---@field SelectableTextAlign         integer = 28,  // ImVec2 SelectableTextAlign
---@field SeparatorTextBorderSize     integer = 29,  // float SeparatorTextBorderSize
---@field SeparatorTextAlign          integer = 30,  // ImVec2 SeparatorTextAlign
---@field SeparatorTextPadding        integer = 31,  // ImVec2 SeparatorTextPadding
---@field Count                       integer = 33,
ImGuiStyleVar = {
	-- Alpha                   = 0, -- `float`
	-- DisabledAlpha           = 1, -- `float`
	-- WindowPadding           = 2, -- `ImVec2`
	-- WindowRounding          = 3, -- `float`
	-- WindowBorderSize        = 4, -- `float`
	-- WindowMinSize           = 5, -- `ImVec2`
	-- WindowTitleAlign        = 6, -- `ImVec2`
	-- ChildRounding           = 7, -- `float`
	-- ChildBorderSize         = 8, -- `float`
	-- PopupRounding           = 9, -- `float`
	-- PopupBorderSize         = 10, -- `float`
	-- FramePadding            = 11, -- `ImVec2`
	-- FrameRounding           = 12, -- `float`
	-- FrameBorderSize         = 13, -- `float`
	-- ItemSpacing             = 14, -- `ImVec2`
	-- ItemInnerSpacing        = 15, -- `ImVec2`
	-- IndentSpacing           = 16, -- `float`
	-- CellPadding             = 17, -- `ImVec2`
	-- ScrollbarSize           = 18, -- `float`
	-- ScrollbarRounding       = 19, -- `float`
	-- GrabMinSize             = 20, -- `float`
	-- GrabRounding            = 21, -- `float`
	-- TabRounding             = 22, -- `float`
	-- ButtonTextAlign         = 23, -- `ImVec2`
	-- SelectableTextAlign     = 24, -- `ImVec2`
	-- SeparatorTextBorderSize = 25, -- `float`
	-- SeparatorTextAlign      = 26, -- `ImVec2`
	-- SeparatorTextPadding    = 27, -- `ImVec2`
	-- Count                   = 28
}

---@class ImGuiCol
---@field Text                  integer = 0
---@field TextDisabled          integer = 1
---@field WindowBg              integer = 2,  // Background of normal windows
---@field ChildBg               integer = 3,  // Background of child windows
---@field PopupBg               integer = 4,  // Background of popups, menus, tooltips windows
---@field Border                integer = 5
---@field BorderShadow          integer = 6
---@field FrameBg               integer = 7,  // Background of checkbox, radio button, plot, slider, text input
---@field FrameBgHovered        integer = 8
---@field FrameBgActive         integer = 9
---@field TitleBg               integer = 10,  // Title bar
---@field TitleBgActive         integer = 11,  // Title bar when focused
---@field TitleBgCollapsed      integer = 12,  // Title bar when collapsed
---@field MenuBarBg             integer = 13
---@field ScrollbarBg           integer = 14
---@field ScrollbarGrab         integer = 15
---@field ScrollbarGrabHovered  integer = 16
---@field ScrollbarGrabActive   integer = 17
---@field CheckMark             integer = 18,  // Checkbox tick and RadioButton circle
---@field SliderGrab            integer = 19
---@field SliderGrabActive      integer = 20
---@field Button                integer = 21
---@field ButtonHovered         integer = 22
---@field ButtonActive          integer = 23
---@field Header                integer = 24,  // Header* colors are used for CollapsingHeader, TreeNode, Selectable, MenuItem
---@field HeaderHovered         integer = 25
---@field HeaderActive          integer = 26
---@field Separator             integer = 27
---@field SeparatorHovered      integer = 28
---@field SeparatorActive       integer = 29
---@field ResizeGrip            integer = 30,  // Resize grip in lower-right and lower-left corners of windows.
---@field ResizeGripHovered     integer = 31
---@field ResizeGripActive      integer = 32
---@field Tab                   integer = 33,  // TabItem in a TabBar
---@field TabHovered            integer = 34
---@field TabActive             integer = 35
---@field TabUnfocusedActive    integer = 37
---@field PlotLines             integer = 38
---@field PlotLinesHovered      integer = 39
---@field PlotHistogram         integer = 40
---@field PlotHistogramHovered  integer = 41
---@field TableHeaderBg         integer = 42,  // Table header background
---@field TableBorderStrong     integer = 43,  // Table outer and header borders (prefer using Alpha=1.0 here)
---@field TableBorderLight      integer = 44,  // Table inner borders (prefer using Alpha=1.0 here)
---@field TableRowBg            integer = 45,  // Table row background (even rows)
---@field TableRowBgAlt         integer = 46,  // Table row background (odd rows)
---@field TextSelectedBg        integer = 47
---@field DragDropTarget        integer = 48,  // Rectangle highlighting a drop target
---@field NavHighlight          integer = 49,  // Gamepad/keyboard: current highlighted item
---@field NavWindowingHighlight integer = 50,  // Highlight window when using CTRL+TAB
---@field NavWindowingDimBg     integer = 51,  // Darken/colorize entire screen behind the CTRL+TAB window list, when active
---@field ModalWindowDimBg      integer = 52,  // Darken/colorize entire screen behind a modal window, when one is active
---@field Count	                integer = 53,
ImGuiCol = {}

---@class ImGuiWindowFlags
---@field None                      integer = 0
---@field NoTitleBar                integer = 1 << 0,  // Disable title-bar
---@field NoResize                  integer = 1 << 1,  // Disable user resizing with the lower-right grip
---@field NoMove                    integer = 1 << 2,  // Disable user moving the window
---@field NoScrollbar               integer = 1 << 3,  // Disable scrollbars (window can still scroll with mouse or programmatically)
---@field NoScrollWithMouse         integer = 1 << 4,  // Disable user vertically scrolling with mouse wheel. On child window, mouse wheel will be forwarded to the parent unless NoScrollbar is also set.
---@field NoCollapse                integer = 1 << 5,  // Disable user collapsing window by double-clicking on it. Also referred to as Window Menu Button (e.g. within a docking node).
---@field AlwaysAutoResize          integer = 1 << 6,  // Resize every window to its content every frame
---@field NoBackground              integer = 1 << 7,  // Disable drawing background color (WindowBg, etc.) and outside border. Similar as using SetNextWindowBgAlpha(0.0f).
---@field NoSavedSettings           integer = 1 << 8,  // Never load/save settings in .ini file
---@field NoMouseInputs             integer = 1 << 9,  // Disable catching mouse, hovering test with pass through.
---@field MenuBar                   integer = 1 << 10,  // Has a menu-bar
---@field HorizontalScrollbar       integer = 1 << 11,  // Allow horizontal scrollbar to appear (off by default). You may use SetNextWindowContentSize(ImVec2(width,0.0f)); prior to calling Begin() to specify width. Read code in imgui_demo in the "Horizontal Scrolling" section.
---@field NoFocusOnAppearing        integer = 1 << 12,  // Disable taking focus when transitioning from hidden to visible state
---@field NoBringToFrontOnFocus     integer = 1 << 13,  // Disable bringing window to front when taking focus (e.g. clicking on it or programmatically giving it focus)
---@field AlwaysVerticalScrollbar   integer = 1 << 14,  // Always show vertical scrollbar (even if ContentSize.y < Size.y)
---@field AlwaysHorizontalScrollbar integer = 1 << 15,  // Always show horizontal scrollbar (even if ContentSize.x < Size.x)
---@field NoNavInputs               integer = 1 << 16,  // No gamepad/keyboard navigation within the window
---@field NoNavFocus                integer = 1 << 17,  // No focusing toward this window with gamepad/keyboard navigation (e.g. skipped by CTRL+TAB)
---@field UnsavedDocument           integer = 1 << 18,  // Display a dot next to the title. When used in a tab/docking context, tab is selected when clicking the X + closure is not assumed (will wait for user to stop submitting the tab). Otherwise closure is assumed when pressing the X, so if you keep submitting the tab may reappear at end of tab bar.
---@field NoNav                     integer = 196608
---@field NoDecoration              integer = 43
---@field NoInputs                  integer = 197120
---@field NavFlattened              integer = 1 << 23,  // [BETA] On child window: share focus scope, allow gamepad/keyboard navigation to cross over parent border to this child or between sibling child windows.   
---@field ChildWindow               integer = 1 << 24,  // Don't use! For internal use by BeginChild()
---@field Tooltip                   integer = 1 << 25,  // Don't use! For internal use by BeginTooltip()
---@field Popup                     integer = 1 << 26,  // Don't use! For internal use by BeginPopup()
---@field Modal                     integer = 1 << 27,  // Don't use! For internal use by BeginPopupModal()
---@field ChildMenu                 integer = 1 << 28,  // Don't use! For internal use by BeginMenu()
ImGuiWindowFlags = {}

---@class ImGuiSliderFlags
---@field None            integer = 0
---@field AlwaysClamp     integer = 1 << 4,  // Clamp value to min/max bounds when input manually with CTRL+Click. By default CTRL+Click allows going out of bounds.
---@field Logarithmic     integer = 1 << 5,  // Make the widget logarithmic (linear otherwise). Consider using ImGuiSliderFlags_NoRoundToFormat with this if using a format-string with small amount of digits.       
---@field NoRoundToFormat integer = 1 << 6,  // Disable rounding underlying value to match precision of the display format string (e.g. %.3f values are rounded to those 3 digits)
---@field NoInput         integer = 1 << 7,  // Disable CTRL+Click or Enter key allowing to input text directly into the widget
---@field InvalidMask_    integer = 1879048207,  // [Internal] We treat using those bits as being potentially a 'float power' argument from the previous API that has got miscast to this enum, and will trigger an assert if needed.
ImGuiSliderFlags = {}

---@class ImGuiTabItemFlags
---@field None                         integer = 0
---@field UnsavedDocument              integer = 1 << 0,  // Display a dot next to the title + set ImGuiTabItemFlags_NoAssumedClosure.
---@field SetSelected                  integer = 1 << 1,  // Trigger flag to programmatically make the tab selected when calling BeginTabItem()
---@field NoCloseWithMiddleMouseButton integer = 1 << 2,  // Disable behavior of closing tabs (that are submitted with p_open != NULL) with middle mouse button. You may handle this behavior manually on user's side with if (IsItemHovered() && IsMouseClicked(2)) *p_open = false.
---@field NoPushId                     integer = 1 << 3,  // Don't call PushID()/PopID() on BeginTabItem()/EndTabItem()
---@field NoTooltip                    integer = 1 << 4,  // Disable tooltip for the given tab
---@field NoReorder                    integer = 1 << 5,  // Disable reordering this tab or having another tab cross over this tab
---@field Leading                      integer = 1 << 6,  // Enforce the tab position to the left of the tab bar (after the tab list popup button)
---@field Trailing                     integer = 1 << 7,  // Enforce the tab position to the right of the tab bar (before the scrolling buttons)
---@field NoAssumedClosure             integer = 1 << 8,  // Tab is selected when trying to close + closure is not immediately assumed (will wait for user to stop submitting the tab). Otherwise closure is assumed when pressing the X, so if you keep submitting the tab may reappear at end of tab bar.
ImGuiTabItemFlags = {}

---@class ImGuiInputTextFlags
---@field All                 integer = 2097151
---@field None                integer = 0
---@field CharsDecimal        integer = 1 << 0,  // Allow 0123456789.+-*/
---@field CharsHexadecimal    integer = 1 << 1,  // Allow 0123456789ABCDEFabcdef
---@field CharsUppercase      integer = 1 << 2,  // Turn a..z into A..Z
---@field CharsNoBlank        integer = 1 << 3,  // Filter out spaces, tabs
---@field AutoSelectAll       integer = 1 << 4,  // Select entire text when first taking mouse focus
---@field EnterReturnsTrue    integer = 1 << 5,  // Return 'true' when Enter is pressed (as opposed to every time the value was modified). Consider looking at the IsItemDeactivatedAfterEdit() function.
---@field CallbackCompletion  integer = 1 << 6,  // Callback on pressing TAB (for completion handling)
---@field CallbackHistory     integer = 1 << 7,  // Callback on pressing Up/Down arrows (for history handling)
---@field CallbackAlways      integer = 1 << 8,  // Callback on each iteration. User code may query cursor position, modify text buffer.
---@field CallbackCharFilter  integer = 1 << 9,  // Callback on character inputs to replace or discard them. Modify 'EventChar' to replace or discard, or return 1 in callback to discard.
---@field AllowTabInput       integer = 1 << 10,  // Pressing TAB input a '\t' character into the text field
---@field CtrlEnterForNewLine integer = 1 << 11,  // In multi-line mode, unfocus with Enter, add new line with Ctrl+Enter (default is opposite: unfocus with Ctrl+Enter, add line with Enter).
---@field NoHorizontalScroll  integer = 1 << 12,  // Disable following the cursor horizontally
---@field AlwaysOverwrite     integer = 1 << 13,  // Overwrite mode
---@field ReadOnly            integer = 1 << 14,  // Read-only mode
---@field Password            integer = 1 << 15,  // Password mode, display all characters as '*'
---@field NoUndoRedo          integer = 1 << 16,  // Disable undo/redo. Note that input text owns the text data while active, if you want to provide your own undo/redo stack you need e.g. to call ClearActiveID().  
---@field CharsScientific     integer = 1 << 17,  // Allow 0123456789.+-*/eE (Scientific notation input)
---@field CallbackResize      integer = 1 << 18,  // Callback on buffer capacity changes request (beyond 'buf_size' parameter value), allowing the string to grow. Notify when the string wants to be resized (for string types which hold a cache of their Size). You will be provided a new BufSize in the callback and NEED to honor it. (see misc/cpp/imgui_stdlib.h for an example of using this)
---@field CallbackEdit        integer = 1 << 19,  // Callback on any edit (note that InputText() already returns true on edit, the callback is useful mainly to manipulate the underlying buffer while focus is active)
---@field EscapeClearsAll     integer = 1 << 20,  // Escape key clears content if not empty, and deactivate otherwise (contrast to default behavior of Escape to revert)
ImGuiInputTextFlags = {}

---@class ImGuiHoveredFlags
---@field All                          integer = 262063
---@field None                         integer = 0,  // Return true if directly over the item/window, not obstructed by another window, not obstructed by an active popup or modal blocking inputs under them.
---@field ChildWindows                 integer = 1 << 0,  // IsWindowHovered() only: Return true if any children of the window is hovered
---@field RootWindow                   integer = 1 << 1,  // IsWindowHovered() only: Test from root window (top most parent of the current hierarchy)
---@field AnyWindow                    integer = 1 << 2,  // IsWindowHovered() only: Return true if any window is hovered
---@field NoPopupHierarchy             integer = 1 << 3,  // IsWindowHovered() only: Do not consider popup hierarchy (do not treat popup emitter as parent of popup) (when used with _ChildWindows or _RootWindow)    
---@field AllowWhenBlockedByPopup      integer = 1 << 5,  // Return true even if a popup window is normally blocking access to this item/window
---@field AllowWhenBlockedByActiveItem integer = 1 << 7,  // Return true even if an active item is blocking access to this item/window. Useful for Drag and Drop patterns.
---@field AllowWhenOverlappedByItem    integer = 1 << 8,  // IsItemHovered() only: Return true even if the item uses AllowOverlap mode and is overlapped by another hoverable item.
---@field AllowWhenOverlappedByWindow  integer = 1 << 9,  // IsItemHovered() only: Return true even if the position is obstructed or overlapped by another window.
---@field AllowWhenDisabled            integer = 1 << 10,  // IsItemHovered() only: Return true even if the item is disabled
---@field NoNavOverride                integer = 1 << 11,  // IsItemHovered() only: Disable using gamepad/keyboard navigation state when active, always query mouse
---@field AllowWhenOverlapped          integer = 768
---@field RectOnly                     integer = 928
---@field RootAndChildWindows          integer = 3
---@field ForTooltip                   integer = 1 << 12,  // Shortcut for standard flags when using IsItemHovered() + SetTooltip() sequence.
---@field Stationary                   integer = 1 << 13,  // Require mouse to be stationary for style.HoverStationaryDelay (~0.15 sec) at least one time. After this, can move on same item/window. Using the stationary test tends to reduces the need for a long delay.
---@field DelayNone                    integer = 1 << 14,  // IsItemHovered() only: Return true immediately (default). As this is the default you generally ignore this.
---@field DelayShort                   integer = 1 << 15,  // IsItemHovered() only: Return true after style.HoverDelayShort elapsed (~0.15 sec) (shared between items) + requires mouse to be stationary for style.HoverStationaryDelay (once per item).
---@field DelayNormal                  integer = 1 << 16,  // IsItemHovered() only: Return true after style.HoverDelayNormal elapsed (~0.40 sec) (shared between items) + requires mouse to be stationary for style.HoverStationaryDelay (once per item).
---@field NoSharedDelay                integer = 1 << 17,  // IsItemHovered() only: Disable shared delay system where moving from one item to the next keeps the previous timer for a short time (standard for tooltips with long delays)
ImGuiHoveredFlags = {}

---@class ImGuiCond
---@field None         integer = 0,  // No condition (always set the variable), same as _Always
---@field Always       integer = 1 << 0,  // No condition (always set the variable), same as _None
---@field Once         integer = 1 << 1,  // Set the variable once per runtime session (only the first call will succeed)
---@field FirstUseEver integer = 1 << 2,  // Set the variable if the object/window has no persistently saved data (no entry in .ini file)
---@field Appearing    integer = 1 << 3,  // Set the variable if the object/window is appearing after being hidden/inactive (or the first time) Instance Method S
ImGuiCond = {}

---@class ImGui
ImGui = {}

---@param name string
---@return boolean
function ImGui.Begin(name) end

---@param name string
---@param flags integer
---@return boolean
function ImGui.Begin(name, flags) end

---@param name string
---@param open boolean
---@return boolean
---@return boolean
function ImGui.Begin(name, open) end

---@param name string
---@param open boolean
---@param flags integer
---@return boolean
---@return boolean
function ImGui.Begin(name, open, flags) end

function ImGui.End() end

---@param name string
---@return boolean
function ImGui.BeginChild(name) end

---@param name string
---@param sizeX number
---@return boolean
function ImGui.BeginChild(name, sizeX) end

---@param name string
---@param sizeX number
---@param sizeY number
---@return boolean
function ImGui.BeginChild(name, sizeX, sizeY) end

---@param name string
---@param sizeX number
---@param sizeY number
---@param border boolean
---@return boolean
function ImGui.BeginChild(name, sizeX, sizeY, border) end

---@param name string
---@param sizeX number
---@param sizeY number
---@param border boolean
---@param flags integer
---@return boolean
function ImGui.BeginChild(name, sizeX, sizeY, border, flags) end

function ImGui.EndChild() end

---@return boolean
function ImGui.IsWindowAppearing() end

---@return boolean
function ImGui.IsWindowCollapsed() end

---@return boolean
function ImGui.IsWindowFocused() end

---@param flags integer
---@return boolean
function ImGui.IsWindowFocused(flags) end

---@return boolean
function ImGui.IsWindowHovered() end

---@param flags integer
---@return boolean
function ImGui.IsWindowHovered(flags) end

---@return ImDrawList
function ImGui.GetWindowDrawList() end

---@return number
---@return number
function ImGui.GetWindowPos() end

---@return number
---@return number
function ImGui.GetWindowSize() end

---@return number
function ImGui.GetWindowWidth() end

---@return number
function ImGui.GetWindowHeight() end

---@param posX number
---@param posY number
function ImGui.SetNextWindowPos(posX, posY) end

---@param posX number
---@param posY number
---@param cond integer
function ImGui.SetNextWindowPos(posX, posY, cond) end

---@param posX number
---@param posY number
---@param cond integer
---@param pivotX number
---@param pivotY number
function ImGui.SetNextWindowPos(posX, posY, cond, pivotX, pivotY) end

---@param sizeX number
---@param sizeY number
function ImGui.SetNextWindowSize(sizeX, sizeY) end

---@param sizeX number
---@param sizeY number
---@param cond integer
function ImGui.SetNextWindowSize(sizeX, sizeY, cond) end

---@param minX number
---@param minY number
---@param maxX number
---@param maxY number
function ImGui.SetNextWindowSizeConstraints(minX, minY, maxX, maxY) end

---@param sizeX number
---@param sizeY number
function ImGui.SetNextWindowContentSize(sizeX, sizeY) end

---@param collapsed boolean
function ImGui.SetNextWindowCollapsed(collapsed) end

---@param collapsed boolean
---@param cond integer
function ImGui.SetNextWindowCollapsed(collapsed, cond) end

function ImGui.SetNextWindowFocus() end

---@param alpha number
function ImGui.SetNextWindowBgAlpha(alpha) end

---@param posX number
---@param posY number
function ImGui.SetWindowPos(posX, posY) end

---@param posX number
---@param posY number
---@param cond integer
function ImGui.SetWindowPos(posX, posY, cond) end

---@param sizeX number
---@param sizeY number
function ImGui.SetWindowSize(sizeX, sizeY) end

---@param sizeX number
---@param sizeY number
---@param cond integer
function ImGui.SetWindowSize(sizeX, sizeY, cond) end

---@param collapsed boolean
function ImGui.SetWindowCollapsed(collapsed) end

---@param collapsed boolean
---@param cond integer
function ImGui.SetWindowCollapsed(collapsed, cond) end

function ImGui.SetWindowFocus() end

---@param scale number
function ImGui.SetWindowFontScale(scale) end

---@param name string
---@param posX number
---@param posY number
function ImGui.SetWindowPos(name, posX, posY) end

---@param name string
---@param posX number
---@param posY number
---@param cond integer
function ImGui.SetWindowPos(name, posX, posY, cond) end

---@param name string
---@param sizeX number
---@param sizeY number
function ImGui.SetWindowSize(name, sizeX, sizeY) end

---@param name string
---@param sizeX number
---@param sizeY number
---@param cond integer
function ImGui.SetWindowSize(name, sizeX, sizeY, cond) end

---@param name string
---@param collapsed boolean
function ImGui.SetWindowCollapsed(name, collapsed) end

---@param name string
---@param collapsed boolean
---@param cond integer
function ImGui.SetWindowCollapsed(name, collapsed, cond) end

---@param name string
function ImGui.SetWindowFocus(name) end

---@return number
---@return number
function ImGui.GetContentRegionMax() end

---@return number
---@return number
function ImGui.GetContentRegionAvail() end

---@return number
---@return number
function ImGui.GetWindowContentRegionMin() end

---@return number
---@return number
function ImGui.GetWindowContentRegionMax() end

---@return number
function ImGui.GetScrollX() end

---@return number
function ImGui.GetScrollY() end

---@return number
function ImGui.GetScrollMaxX() end

---@return number
function ImGui.GetScrollMaxY() end

---@param scrollX number
function ImGui.SetScrollX(scrollX) end

---@param scrollY number
function ImGui.SetScrollY(scrollY) end

function ImGui.SetScrollHereX() end

---@param centerXRatio number
function ImGui.SetScrollHereX(centerXRatio) end

function ImGui.SetScrollHereY() end

---@param centerYRatio number
function ImGui.SetScrollHereY(centerYRatio) end

---@param localX number
function ImGui.SetScrollFromPosX(localX) end

---@param localX number
---@param centerXRatio number
function ImGui.SetScrollFromPosX(localX, centerXRatio) end

---@param localY number
function ImGui.SetScrollFromPosY(localY) end

---@param localY number
---@param centerYRatio number
function ImGui.SetScrollFromPosY(localY, centerYRatio) end

---@param idx integer
---@param col integer
function ImGui.PushStyleColor(idx, col) end

---@param idx integer
---@param colR number
---@param colG number
---@param colB number
---@param colA number
function ImGui.PushStyleColor(idx, colR, colG, colB, colA) end

function ImGui.PopStyleColor() end

---@param count integer
function ImGui.PopStyleColor(count) end

---@param idx integer
---@param val number
function ImGui.PushStyleVar(idx, val) end

---@param idx integer
---@param valX number
---@param valY number
function ImGui.PushStyleVar(idx, valX, valY) end

function ImGui.PopStyleVar() end

---@param count integer
function ImGui.PopStyleVar(count) end

---@param idx integer
---@return number
---@return number
---@return number
---@return number
function ImGui.GetStyleColorVec4(idx) end

---@return number
function ImGui.GetFontSize() end

---@return number
---@return number
function ImGui.GetFontTexUvWhitePixel() end

---@param idx integer
---@param alphaMul number
---@return integer
function ImGui.GetColorU32(idx, alphaMul) end

---@param colR number
---@param colG number
---@param colB number
---@param colA number
---@return integer
function ImGui.GetColorU32(colR, colG, colB, colA) end

---@param col integer
---@return integer
function ImGui.GetColorU32(col) end

---@param itemWidth number
function ImGui.PushItemWidth(itemWidth) end

function ImGui.PopItemWidth() end

---@param itemWidth number
function ImGui.SetNextItemWidth(itemWidth) end

---@return number
function ImGui.CalcItemWidth() end

function ImGui.PushTextWrapPos() end

---@param wrapLocalPosX number
function ImGui.PushTextWrapPos(wrapLocalPosX) end

function ImGui.PopTextWrapPos() end

---@param allowKeyboardFocus boolean
function ImGui.PushAllowKeyboardFocus(allowKeyboardFocus) end

function ImGui.PopAllowKeyboardFocus() end

---@param _repeat boolean
function ImGui.PushButtonRepeat(_repeat) end

function ImGui.PopButtonRepeat() end

function ImGui.Separator() end

---@param label string
function ImGui.SeparatorText(label) end

function ImGui.SameLine() end

---@param offsetFromStartX number
function ImGui.SameLine(offsetFromStartX) end

---@param offsetFromStartX number
---@param spacing number
function ImGui.SameLine(offsetFromStartX, spacing) end

function ImGui.NewLine() end

function ImGui.Spacing() end

---@param sizeX number
---@param sizeY number
function ImGui.Dummy(sizeX, sizeY) end

function ImGui.Indent() end

---@param indentW number
function ImGui.Indent(indentW) end

function ImGui.Unindent() end

---@param indentW number
function ImGui.Unindent(indentW) end

function ImGui.BeginGroup() end

function ImGui.EndGroup() end

---@return number
---@return number
function ImGui.GetCursorPos() end

---@return number
function ImGui.GetCursorPosX() end

---@return number
function ImGui.GetCursorPosY() end

---@param localX number
---@param localY number
function ImGui.SetCursorPos(localX, localY) end

---@param localX number
function ImGui.SetCursorPosX(localX) end

---@param localY number
function ImGui.SetCursorPosY(localY) end

---@return number
---@return number
function ImGui.GetCursorStartPos() end

---@return number
---@return number
function ImGui.GetCursorScreenPos() end

---@param posX number
---@param posY number
function ImGui.SetCursorScreenPos(posX, posY) end

function ImGui.AlignTextToFramePadding() end

---@return number
function ImGui.GetTextLineHeight() end

---@return number
function ImGui.GetTextLineHeightWithSpacing() end

---@return number
function ImGui.GetFrameHeight() end

---@return number
function ImGui.GetFrameHeightWithSpacing() end

---@param stringID string
function ImGui.PushID(stringID) end

---@param intID integer
function ImGui.PushID(intID) end

function ImGui.PopID() end

---@param stringID string
---@return integer
function ImGui.GetID(stringID) end

---@param text string
function ImGui.TextUnformatted(text) end

---@param text string
function ImGui.Text(text) end

---@param colR number
---@param colG number
---@param colB number
---@param colA number
---@param text string
function ImGui.TextColored(colR, colG, colB, colA, text) end

---@param text string
function ImGui.TextDisabled(text) end

---@param text string
function ImGui.TextWrapped(text) end

---@param label string
---@param text string
function ImGui.LabelText(label, text) end

---@param text string
function ImGui.BulletText(text) end

---@param label string
---@return boolean
function ImGui.Button(label) end

---@param label string
---@param sizeX number
---@param sizeY number
---@return boolean
function ImGui.Button(label, sizeX, sizeY) end

---@param label string
---@return boolean
function ImGui.SmallButton(label) end

---@param stringID string
---@param sizeX number
---@param sizeY number
---@return boolean
function ImGui.InvisibleButton(stringID, sizeX, sizeY) end

---@param stringID string
---@param dir integer
---@return boolean
function ImGui.ArrowButton(stringID, dir) end

function ImGui.Image() end

function ImGui.ImageButton() end

---@param label string
---@param v boolean
---@return boolean
---@return boolean
function ImGui.Checkbox(label, v) end

---@return boolean
function ImGui.CheckboxFlags() end

---@param label string
---@param active boolean
---@return boolean
function ImGui.RadioButton(label, active) end

---@param label string
---@param v integer
---@param vButton integer
---@return integer
---@return boolean
function ImGui.RadioButton(label, v, vButton) end

---@param fraction number
function ImGui.ProgressBar(fraction) end

---@param fraction number
---@param sizeX number
---@param sizeY number
function ImGui.ProgressBar(fraction, sizeX, sizeY) end

---@param fraction number
---@param sizeX number
---@param sizeY number
---@param overlay string
function ImGui.ProgressBar(fraction, sizeX, sizeY, overlay) end

function ImGui.Bullet() end

---@param label string
---@param previewValue string
---@return boolean
function ImGui.BeginCombo(label, previewValue) end

---@param label string
---@param previewValue string
---@param flags integer
---@return boolean
function ImGui.BeginCombo(label, previewValue, flags) end

function ImGui.EndCombo() end

---@param label string
---@param currentItem integer
---@param items table
---@param itemsCount integer
---@return integer
---@return boolean
function ImGui.Combo(label, currentItem, items, itemsCount) end

---@param label string
---@param currentItem integer
---@param items table
---@param itemsCount integer
---@param popupMaxHeightInItems integer
---@return integer
---@return boolean
function ImGui.Combo(label, currentItem, items, itemsCount, popupMaxHeightInItems) end

---@param label string
---@param currentItem integer
---@param itemsSeparatedByZeros string
---@return integer
---@return boolean
function ImGui.Combo(label, currentItem, itemsSeparatedByZeros) end

---@param label string
---@param currentItem integer
---@param itemsSeparatedByZeros string
---@param popupMaxHeightInItems integer
---@return integer
---@return boolean
function ImGui.Combo(label, currentItem, itemsSeparatedByZeros, popupMaxHeightInItems) end

---@param label string
---@param v number
---@return number
---@return boolean
function ImGui.DragFloat(label, v) end

---@param label string
---@param v number
---@param v_speed number
---@return number
---@return boolean
function ImGui.DragFloat(label, v, v_speed) end

---@param label string
---@param v number
---@param v_speed number
---@param v_min number
---@return number
---@return boolean
function ImGui.DragFloat(label, v, v_speed, v_min) end

---@param label string
---@param v number
---@param v_speed number
---@param v_min number
---@param v_max number
---@return number
---@return boolean
function ImGui.DragFloat(label, v, v_speed, v_min, v_max) end

---@param label string
---@param v number
---@param v_speed number
---@param v_min number
---@param v_max number
---@param format string
---@return number
---@return boolean
function ImGui.DragFloat(label, v, v_speed, v_min, v_max, format) end

---@param label string
---@param v number
---@param v_speed number
---@param v_min number
---@param v_max number
---@param format string
---@param flags integer
---@return number
---@return boolean
function ImGui.DragFloat(label, v, v_speed, v_min, v_max, format, flags) end

---@param label string
---@param v table
---@return table
---@return boolean
function ImGui.DragFloat2(label, v) end

---@param label string
---@param v table
---@param v_speed number
---@return table
---@return boolean
function ImGui.DragFloat2(label, v, v_speed) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min number
---@return table
---@return boolean
function ImGui.DragFloat2(label, v, v_speed, v_min) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min number
---@param v_max number
---@return table
---@return boolean
function ImGui.DragFloat2(label, v, v_speed, v_min, v_max) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min number
---@param v_max number
---@param format string
---@return table
---@return boolean
function ImGui.DragFloat2(label, v, v_speed, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min number
---@param v_max number
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.DragFloat2(label, v, v_speed, v_min, v_max, format, flags) end

---@param label string
---@param v table
---@return table
---@return boolean
function ImGui.DragFloat3(label, v) end

---@param label string
---@param v table
---@param v_speed number
---@return table
---@return boolean
function ImGui.DragFloat3(label, v, v_speed) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min number
---@return table
---@return boolean
function ImGui.DragFloat3(label, v, v_speed, v_min) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min number
---@param v_max number
---@return table
---@return boolean
function ImGui.DragFloat3(label, v, v_speed, v_min, v_max) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min number
---@param v_max number
---@param format string
---@return table
---@return boolean
function ImGui.DragFloat3(label, v, v_speed, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min number
---@param v_max number
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.DragFloat3(label, v, v_speed, v_min, v_max, format, flags) end

---@param label string
---@param v table
---@return table
---@return boolean
function ImGui.DragFloat4(label, v) end

---@param label string
---@param v table
---@param v_speed number
---@return table
---@return boolean
function ImGui.DragFloat4(label, v, v_speed) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min number
---@return table
---@return boolean
function ImGui.DragFloat4(label, v, v_speed, v_min) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min number
---@param v_max number
---@return table
---@return boolean
function ImGui.DragFloat4(label, v, v_speed, v_min, v_max) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min number
---@param v_max number
---@param format string
---@return table
---@return boolean
function ImGui.DragFloat4(label, v, v_speed, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min number
---@param v_max number
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.DragFloat4(label, v, v_speed, v_min, v_max, format, flags) end

function ImGui.DragFloatRange2() end

---@param label string
---@param v integer
---@return integer
---@return boolean
function ImGui.DragInt(label, v) end

---@param label string
---@param v integer
---@param v_speed number
---@return integer
---@return boolean
function ImGui.DragInt(label, v, v_speed) end

---@param label string
---@param v integer
---@param v_speed number
---@param v_min integer
---@return integer
---@return boolean
function ImGui.DragInt(label, v, v_speed, v_min) end

---@param label string
---@param v integer
---@param v_speed number
---@param v_min integer
---@param v_max integer
---@return integer
---@return boolean
function ImGui.DragInt(label, v, v_speed, v_min, v_max) end

---@param label string
---@param v integer
---@param v_speed number
---@param v_min integer
---@param v_max integer
---@param format string
---@return integer
---@return boolean
function ImGui.DragInt(label, v, v_speed, v_min, v_max, format) end

---@param label string
---@param v integer
---@param v_speed number
---@param v_min integer
---@param v_max integer
---@param format string
---@param flags integer
---@return integer
---@return boolean
function ImGui.DragInt(label, v, v_speed, v_min, v_max, format, flags) end

---@param label string
---@param v table
---@return table
---@return boolean
function ImGui.DragInt2(label, v) end

---@param label string
---@param v table
---@param v_speed number
---@return table
---@return boolean
function ImGui.DragInt2(label, v, v_speed) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min integer
---@return table
---@return boolean
function ImGui.DragInt2(label, v, v_speed, v_min) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min integer
---@param v_max integer
---@return table
---@return boolean
function ImGui.DragInt2(label, v, v_speed, v_min, v_max) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min integer
---@param v_max integer
---@param format string
---@return table
---@return boolean
function ImGui.DragInt2(label, v, v_speed, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min integer
---@param v_max integer
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.DragInt2(label, v, v_speed, v_min, v_max, format, flags) end

---@param label string
---@param v table
---@return table
---@return boolean
function ImGui.DragInt3(label, v) end

---@param label string
---@param v table
---@param v_speed number
---@return table
---@return boolean
function ImGui.DragInt3(label, v, v_speed) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min integer
---@return table
---@return boolean
function ImGui.DragInt3(label, v, v_speed, v_min) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min integer
---@param v_max integer
---@return table
---@return boolean
function ImGui.DragInt3(label, v, v_speed, v_min, v_max) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min integer
---@param v_max integer
---@param format string
---@return table
---@return boolean
function ImGui.DragInt3(label, v, v_speed, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min integer
---@param v_max integer
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.DragInt3(label, v, v_speed, v_min, v_max, format, flags) end

---@param label string
---@param v table
---@return table
---@return boolean
function ImGui.DragInt4(label, v) end

---@param label string
---@param v table
---@param v_speed number
---@return table
---@return boolean
function ImGui.DragInt4(label, v, v_speed) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min integer
---@return table
---@return boolean
function ImGui.DragInt4(label, v, v_speed, v_min) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min integer
---@param v_max integer
---@return table
---@return boolean
function ImGui.DragInt4(label, v, v_speed, v_min, v_max) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min integer
---@param v_max integer
---@param format string
---@return table
---@return boolean
function ImGui.DragInt4(label, v, v_speed, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_speed number
---@param v_min integer
---@param v_max integer
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.DragInt4(label, v, v_speed, v_min, v_max, format, flags) end

function ImGui.DragIntRange2() end

function ImGui.DragScalar() end

function ImGui.DragScalarN() end

---@param label string
---@param v number
---@param v_min number
---@param v_max number
---@return number
---@return boolean
function ImGui.SliderFloat(label, v, v_min, v_max) end

---@param label string
---@param v number
---@param v_min number
---@param v_max number
---@param format string
---@return number
---@return boolean
function ImGui.SliderFloat(label, v, v_min, v_max, format) end

---@param label string
---@param v number
---@param v_min number
---@param v_max number
---@param format string
---@param flags integer
---@return number
---@return boolean
function ImGui.SliderFloat(label, v, v_min, v_max, format, flags) end

---@param label string
---@param v table
---@param v_min number
---@param v_max number
---@return table
---@return boolean
function ImGui.SliderFloat2(label, v, v_min, v_max) end

---@param label string
---@param v table
---@param v_min number
---@param v_max number
---@param format string
---@return table
---@return boolean
function ImGui.SliderFloat2(label, v, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_min number
---@param v_max number
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.SliderFloat2(label, v, v_min, v_max, format, flags) end

---@param label string
---@param v table
---@param v_min number
---@param v_max number
---@return table
---@return boolean
function ImGui.SliderFloat3(label, v, v_min, v_max) end

---@param label string
---@param v table
---@param v_min number
---@param v_max number
---@param format string
---@return table
---@return boolean
function ImGui.SliderFloat3(label, v, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_min number
---@param v_max number
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.SliderFloat3(label, v, v_min, v_max, format, flags) end

---@param label string
---@param v table
---@param v_min number
---@param v_max number
---@return table
---@return boolean
function ImGui.SliderFloat4(label, v, v_min, v_max) end

---@param label string
---@param v table
---@param v_min number
---@param v_max number
---@param format string
---@return table
---@return boolean
function ImGui.SliderFloat4(label, v, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_min number
---@param v_max number
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.SliderFloat4(label, v, v_min, v_max, format, flags) end

---@param label string
---@param v_rad number
---@return number
---@return boolean
function ImGui.SliderAngle(label, v_rad) end

---@param label string
---@param v_rad number
---@param v_degrees_min number
---@return number
---@return boolean
function ImGui.SliderAngle(label, v_rad, v_degrees_min) end

---@param label string
---@param v_rad number
---@param v_degrees_min number
---@param v_degrees_max number
---@return number
---@return boolean
function ImGui.SliderAngle(label, v_rad, v_degrees_min, v_degrees_max) end

---@param label string
---@param v_rad number
---@param v_degrees_min number
---@param v_degrees_max number
---@param format string
---@return number
---@return boolean
function ImGui.SliderAngle(label, v_rad, v_degrees_min, v_degrees_max, format) end

---@param label string
---@param v_rad number
---@param v_degrees_min number
---@param v_degrees_max number
---@param format string
---@param flags integer
---@return number
---@return boolean
function ImGui.SliderAngle(label, v_rad, v_degrees_min, v_degrees_max, format, flags) end

---@param label string
---@param v integer
---@param v_min integer
---@param v_max integer
---@return integer
---@return boolean
function ImGui.SliderInt(label, v, v_min, v_max) end

---@param label string
---@param v integer
---@param v_min integer
---@param v_max integer
---@param format string
---@return integer
---@return boolean
function ImGui.SliderInt(label, v, v_min, v_max, format) end

---@param label string
---@param v integer
---@param v_min integer
---@param v_max integer
---@param format string
---@param flags integer
---@return integer
---@return boolean
function ImGui.SliderInt(label, v, v_min, v_max, format, flags) end

---@param label string
---@param v table
---@param v_min integer
---@param v_max integer
---@return table
---@return boolean
function ImGui.SliderInt2(label, v, v_min, v_max) end

---@param label string
---@param v table
---@param v_min integer
---@param v_max integer
---@param format string
---@return table
---@return boolean
function ImGui.SliderInt2(label, v, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_min integer
---@param v_max integer
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.SliderInt2(label, v, v_min, v_max, format, flags) end

---@param label string
---@param v table
---@param v_min integer
---@param v_max integer
---@return table
---@return boolean
function ImGui.SliderInt3(label, v, v_min, v_max) end

---@param label string
---@param v table
---@param v_min integer
---@param v_max integer
---@param format string
---@return table
---@return boolean
function ImGui.SliderInt3(label, v, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_min integer
---@param v_max integer
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.SliderInt3(label, v, v_min, v_max, format, flags) end

---@param label string
---@param v table
---@param v_min integer
---@param v_max integer
---@return table
---@return boolean
function ImGui.SliderInt4(label, v, v_min, v_max) end

---@param label string
---@param v table
---@param v_min integer
---@param v_max integer
---@param format string
---@return table
---@return boolean
function ImGui.SliderInt4(label, v, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_min integer
---@param v_max integer
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.SliderInt4(label, v, v_min, v_max, format, flags) end

function ImGui.SliderScalar() end

function ImGui.SliderScalarN() end

---@param label string
---@param sizeX number
---@param sizeY number
---@param v number
---@param v_min number
---@param v_max number
---@return number
---@return boolean
function ImGui.VSliderFloat(label, sizeX, sizeY, v, v_min, v_max) end

---@param label string
---@param sizeX number
---@param sizeY number
---@param v number
---@param v_min number
---@param v_max number
---@param format string
---@return number
---@return boolean
function ImGui.VSliderFloat(label, sizeX, sizeY, v, v_min, v_max, format) end

---@param label string
---@param sizeX number
---@param sizeY number
---@param v number
---@param v_min number
---@param v_max number
---@param format string
---@param flags integer
---@return number
---@return boolean
function ImGui.VSliderFloat(label, sizeX, sizeY, v, v_min, v_max, format, flags) end

---@param label string
---@param sizeX number
---@param sizeY number
---@param v integer
---@param v_min integer
---@param v_max integer
---@return integer
---@return boolean
function ImGui.VSliderInt(label, sizeX, sizeY, v, v_min, v_max) end

---@param label string
---@param sizeX number
---@param sizeY number
---@param v integer
---@param v_min integer
---@param v_max integer
---@param format string
---@return integer
---@return boolean
function ImGui.VSliderInt(label, sizeX, sizeY, v, v_min, v_max, format) end

---@param label string
---@param sizeX number
---@param sizeY number
---@param v integer
---@param v_min integer
---@param v_max integer
---@param format string
---@param flags integer
---@return integer
---@return boolean
function ImGui.VSliderInt(label, sizeX, sizeY, v, v_min, v_max, format, flags) end

function ImGui.VSliderScalar() end

---@param label string
---@param text string
---@param buf_size integer
---@return string
---@return boolean
function ImGui.InputText(label, text, buf_size) end

---@param label string
---@param text string
---@param buf_size integer
---@param flags integer
---@return string
---@return boolean
function ImGui.InputText(label, text, buf_size, flags) end

---@param label string
---@param text string
---@param buf_size integer
---@return string
---@return boolean
function ImGui.InputTextMultiline(label, text, buf_size) end

---@param label string
---@param text string
---@param buf_size integer
---@param sizeX number
---@param sizeY number
---@return string
---@return boolean
function ImGui.InputTextMultiline(label, text, buf_size, sizeX, sizeY) end

---@param label string
---@param text string
---@param buf_size integer
---@param sizeX number
---@param sizeY number
---@param flags integer
---@return string
---@return boolean
function ImGui.InputTextMultiline(label, text, buf_size, sizeX, sizeY, flags) end

---@param label string
---@param hint string
---@param text string
---@param buf_size integer
---@return string
---@return boolean
function ImGui.InputTextWithHint(label, hint, text, buf_size) end

---@param label string
---@param hint string
---@param text string
---@param buf_size integer
---@param flags integer
---@return string
---@return boolean
function ImGui.InputTextWithHint(label, hint, text, buf_size, flags) end

---@param label string
---@param v number
---@return number
---@return boolean
function ImGui.InputFloat(label, v) end

---@param label string
---@param v number
---@param step number
---@return number
---@return boolean
function ImGui.InputFloat(label, v, step) end

---@param label string
---@param v number
---@param step number
---@param step_fast number
---@return number
---@return boolean
function ImGui.InputFloat(label, v, step, step_fast) end

---@param label string
---@param v number
---@param step number
---@param step_fast number
---@param format string
---@return number
---@return boolean
function ImGui.InputFloat(label, v, step, step_fast, format) end

---@param label string
---@param v number
---@param step number
---@param step_fast number
---@param format string
---@param flags integer
---@return number
---@return boolean
function ImGui.InputFloat(label, v, step, step_fast, format, flags) end

---@param label string
---@param v table
---@return table
---@return boolean
function ImGui.InputFloat2(label, v) end

---@param label string
---@param v table
---@param format string
---@return table
---@return boolean
function ImGui.InputFloat2(label, v, format) end

---@param label string
---@param v table
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.InputFloat2(label, v, format, flags) end

---@param label string
---@param v table
---@return table
---@return boolean
function ImGui.InputFloat3(label, v) end

---@param label string
---@param v table
---@param format string
---@return table
---@return boolean
function ImGui.InputFloat3(label, v, format) end

---@param label string
---@param v table
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.InputFloat3(label, v, format, flags) end

---@param label string
---@param v table
---@return table
---@return boolean
function ImGui.InputFloat4(label, v) end

---@param label string
---@param v table
---@param format string
---@return table
---@return boolean
function ImGui.InputFloat4(label, v, format) end

---@param label string
---@param v table
---@param format string
---@param flags integer
---@return table
---@return boolean
function ImGui.InputFloat4(label, v, format, flags) end

---@param label string
---@param v integer
---@return integer
---@return boolean
function ImGui.InputInt(label, v) end

---@param label string
---@param v integer
---@param step integer
---@return integer
---@return boolean
function ImGui.InputInt(label, v, step) end

---@param label string
---@param v integer
---@param step integer
---@param step_fast integer
---@return integer
---@return boolean
function ImGui.InputInt(label, v, step, step_fast) end

---@param label string
---@param v integer
---@param step integer
---@param step_fast integer
---@param flags integer
---@return integer
---@return boolean
function ImGui.InputInt(label, v, step, step_fast, flags) end

---@param label string
---@param v table
---@return table
---@return boolean
function ImGui.InputInt2(label, v) end

---@param label string
---@param v table
---@param flags integer
---@return table
---@return boolean
function ImGui.InputInt2(label, v, flags) end

---@param label string
---@param v table
---@return table
---@return boolean
function ImGui.InputInt3(label, v) end

---@param label string
---@param v table
---@param flags integer
---@return table
---@return boolean
function ImGui.InputInt3(label, v, flags) end

---@param label string
---@param v table
---@return table
---@return boolean
function ImGui.InputInt4(label, v) end

---@param label string
---@param v table
---@param flags integer
---@return table
---@return boolean
function ImGui.InputInt4(label, v, flags) end

---@param label string
---@param v number
---@return number
---@return boolean
function ImGui.InputDouble(label, v) end

---@param label string
---@param v number
---@param step number
---@return number
---@return boolean
function ImGui.InputDouble(label, v, step) end

---@param label string
---@param v number
---@param step number
---@param step_fast number
---@return number
---@return boolean
function ImGui.InputDouble(label, v, step, step_fast) end

---@param label string
---@param v number
---@param step number
---@param step_fast number
---@param format string
---@return number
---@return boolean
function ImGui.InputDouble(label, v, step, step_fast, format) end

---@param label string
---@param v number
---@param step number
---@param step_fast number
---@param format string
---@param flags integer
---@return number
---@return boolean
function ImGui.InputDouble(label, v, step, step_fast, format, flags) end

function ImGui.InputScalar() end

function ImGui.InputScalarN() end

---@param label string
---@param col table
---@return table
---@return boolean
function ImGui.ColorEdit3(label, col) end

---@param label string
---@param col table
---@param flags integer
---@return table
---@return boolean
function ImGui.ColorEdit3(label, col, flags) end

---@param label string
---@param col table
---@return table
---@return boolean
function ImGui.ColorEdit4(label, col) end

---@param label string
---@param col table
---@param flags integer
---@return table
---@return boolean
function ImGui.ColorEdit4(label, col, flags) end

---@param label string
---@param col table
---@return table
---@return boolean
function ImGui.ColorPicker3(label, col) end

---@param label string
---@param col table
---@param flags integer
---@return table
---@return boolean
function ImGui.ColorPicker3(label, col, flags) end

---@param label string
---@param col table
---@return table
---@return boolean
function ImGui.ColorPicker4(label, col) end

---@param label string
---@param col table
---@param flags integer
---@return table
---@return boolean
function ImGui.ColorPicker4(label, col, flags) end

---@param desc_id string
---@param col table
---@return boolean
function ImGui.ColorButton(desc_id, col) end

---@param desc_id string
---@param col table
---@param flags integer
---@return boolean
function ImGui.ColorButton(desc_id, col, flags) end

---@param desc_id string
---@param col table
---@param flags integer
---@param sizeX number
---@param sizeY number
---@return boolean
function ImGui.ColorButton(desc_id, col, flags, sizeX, sizeY) end

---@param flags integer
function ImGui.SetColorEditOptions(flags) end

---@param label string
---@return boolean
function ImGui.TreeNode(label) end

---@param label string
---@param fmt string
---@return boolean
function ImGui.TreeNode(label, fmt) end

---@param label string
---@return boolean
function ImGui.TreeNodeEx(label) end

---@param label string
---@param flags integer
---@return boolean
function ImGui.TreeNodeEx(label, flags) end

---@param label string
---@param flags integer
---@param fmt string
---@return boolean
function ImGui.TreeNodeEx(label, flags, fmt) end

---@param str_id string
function ImGui.TreePush(str_id) end

function ImGui.TreePop() end

---@return number
function ImGui.GetTreeNodeToLabelSpacing() end

---@param label string
---@return boolean
function ImGui.CollapsingHeader(label) end

---@param label string
---@param flags integer
---@return boolean
function ImGui.CollapsingHeader(label, flags) end

---@param label string
---@param open boolean
---@return boolean
---@return boolean
function ImGui.CollapsingHeader(label, open) end

---@param label string
---@param open boolean
---@param flags integer
---@return boolean
---@return boolean
function ImGui.CollapsingHeader(label, open, flags) end

---@param is_open boolean
function ImGui.SetNextItemOpen(is_open) end

---@param is_open boolean
---@param cond integer
function ImGui.SetNextItemOpen(is_open, cond) end

---@param label string
---@return boolean
function ImGui.Selectable(label) end

---@param label string
---@param selected boolean
---@return boolean
function ImGui.Selectable(label, selected) end

---@param label string
---@param selected boolean
---@param flags integer
---@return boolean
function ImGui.Selectable(label, selected, flags) end

---@param label string
---@param selected boolean
---@param flags integer
---@param sizeX number
---@param sizeY number
---@return boolean
function ImGui.Selectable(label, selected, flags, sizeX, sizeY) end

---@param label string
---@param current_item integer
---@param items table
---@param items_count integer
---@return integer
---@return boolean
function ImGui.ListBox(label, current_item, items, items_count) end

---@param label string
---@param current_item integer
---@param items table
---@param items_count integer
---@param height_in_items integer
---@return integer
---@return boolean
function ImGui.ListBox(label, current_item, items, items_count, height_in_items) end

---@param label string
---@return boolean
function ImGui.BeginListBox(label) end

---@param label string
---@param sizeX number
---@param sizeY number
---@return boolean
function ImGui.BeginListBox(label, sizeX, sizeY) end

function ImGui.EndListBox() end

---@param prefix string
---@param b boolean
function ImGui.Value(prefix, b) end

---@param prefix string
---@param v integer
function ImGui.Value(prefix, v) end

---@param prefix string
---@param v integer
function ImGui.Value(prefix, v) end

---@param prefix string
---@param v number
function ImGui.Value(prefix, v) end

---@param prefix string
---@param v number
---@param float_format string
function ImGui.Value(prefix, v, float_format) end

---@return boolean
function ImGui.BeginMenuBar() end

function ImGui.EndMenuBar() end

---@return boolean
function ImGui.BeginMainMenuBar() end

function ImGui.EndMainMenuBar() end

---@param label string
---@return boolean
function ImGui.BeginMenu(label) end

---@param label string
---@param enabled boolean
---@return boolean
function ImGui.BeginMenu(label, enabled) end

function ImGui.EndMenu() end

---@param label string
---@return boolean
function ImGui.MenuItem(label) end

---@param label string
---@param shortcut string
---@return boolean
function ImGui.MenuItem(label, shortcut) end

---@param label string
---@param shortcut string
---@param selected boolean
---@return boolean
---@return boolean
function ImGui.MenuItem(label, shortcut, selected) end

---@param label string
---@param shortcut string
---@param selected boolean
---@param enabled boolean
---@return boolean
---@return boolean
function ImGui.MenuItem(label, shortcut, selected, enabled) end

function ImGui.BeginTooltip() end

function ImGui.EndTooltip() end

---@param fmt string
function ImGui.SetTooltip(fmt) end

function ImGui.SetTooltipV() end

---@param str_id string
---@return boolean
function ImGui.BeginPopup(str_id) end

---@param str_id string
---@param flags integer
---@return boolean
function ImGui.BeginPopup(str_id, flags) end

---@param name string
---@return boolean
function ImGui.BeginPopupModal(name) end

---@param name string
---@param flags integer
---@return boolean
function ImGui.BeginPopupModal(name, flags) end

---@param name string
---@param open boolean
---@return boolean
function ImGui.BeginPopupModal(name, open) end

---@param name string
---@param open boolean
---@param flags integer
---@return boolean
function ImGui.BeginPopupModal(name, open, flags) end

function ImGui.EndPopup() end

---@param str_id string
function ImGui.OpenPopup(str_id) end

---@param str_id string
---@param popup_flags integer
function ImGui.OpenPopup(str_id, popup_flags) end

function ImGui.CloseCurrentPopup() end

---@return boolean
function ImGui.BeginPopupContextItem() end

---@param str_id string
---@return boolean
function ImGui.BeginPopupContextItem(str_id) end

---@param str_id string
---@param popup_flags integer
---@return boolean
function ImGui.BeginPopupContextItem(str_id, popup_flags) end

---@return boolean
function ImGui.BeginPopupContextWindow() end

---@param str_id string
---@return boolean
function ImGui.BeginPopupContextWindow(str_id) end

---@param str_id string
---@param popup_flags integer
---@return boolean
function ImGui.BeginPopupContextWindow(str_id, popup_flags) end

---@return boolean
function ImGui.BeginPopupContextVoid() end

---@param str_id string
---@return boolean
function ImGui.BeginPopupContextVoid(str_id) end

---@param str_id string
---@param popup_flags integer
---@return boolean
function ImGui.BeginPopupContextVoid(str_id, popup_flags) end

---@param str_id string
---@return boolean
function ImGui.IsPopupOpen(str_id) end

---@param str_id string
---@param popup_flags integer
---@return boolean
function ImGui.IsPopupOpen(str_id, popup_flags) end

---@param str_id string
---@param columns integer
---@return boolean
function ImGui.BeginTable(str_id, columns) end

---@param str_id string
---@param columns integer
---@param flags integer
---@return boolean
function ImGui.BeginTable(str_id, columns, flags) end

---@param str_id string
---@param columns integer
---@param flags integer
---@param outer_sizeX number
---@param outer_sizeY number
---@return boolean
function ImGui.BeginTable(str_id, columns, flags, outer_sizeX, outer_sizeY) end

---@param str_id string
---@param columns integer
---@param flags integer
---@param outer_sizeX number
---@param outer_sizeY number
---@param inner_width number
---@return boolean
function ImGui.BeginTable(str_id, columns, flags, outer_sizeX, outer_sizeY, inner_width) end

function ImGui.EndTable() end

function ImGui.TableNextRow() end

---@param flags integer
function ImGui.TableNextRow(flags) end

---@param flags integer
---@param min_row_height number
function ImGui.TableNextRow(flags, min_row_height) end

---@return boolean
function ImGui.TableNextColumn() end

---@param column_n integer
---@return boolean
function ImGui.TableSetColumnIndex(column_n) end

---@param label string
function ImGui.TableSetupColumn(label) end

---@param label string
---@param flags integer
function ImGui.TableSetupColumn(label, flags) end

---@param label string
---@param flags integer
---@param init_width_or_weight number
function ImGui.TableSetupColumn(label, flags, init_width_or_weight) end

---@param label string
---@param flags integer
---@param init_width_or_weight number
---@param user_id integer
function ImGui.TableSetupColumn(label, flags, init_width_or_weight, user_id) end

---@param cols integer
---@param rows integer
function ImGui.TableSetupScrollFreeze(cols, rows) end

function ImGui.TableHeadersRow() end

---@param label string
function ImGui.TableHeader(label) end

---@return ImGuiTableSortSpecs
function ImGui.TableGetSortSpecs() end

---@return integer
function ImGui.TableGetColumnCount() end

---@return integer
function ImGui.TableGetColumnIndex() end

---@return integer
function ImGui.TableGetRowIndex() end

---@return string
function ImGui.TableGetColumnName() end

---@param column_n integer
---@return string
function ImGui.TableGetColumnName(column_n) end

---@return ImGuiTableColumnFlags
function ImGui.TableGetColumnFlags() end

---@param column_n integer
---@return ImGuiTableColumnFlags
function ImGui.TableGetColumnFlags(column_n) end

---@param target integer
---@param color integer
function ImGui.TableSetBgColor(target, color) end

---@param target integer
---@param colR number
---@param colG number
---@param colB number
---@param colA number
function ImGui.TableSetBgColor(target, colR, colG, colB, colA) end

---@param target integer
---@param color integer
---@param column_n integer
function ImGui.TableSetBgColor(target, color, column_n) end

---@param target integer
---@param colR number
---@param colG number
---@param colB number
---@param colA number
---@param column_n integer
function ImGui.TableSetBgColor(target, colR, colG, colB, colA, column_n) end

function ImGui.Columns() end

---@param count integer
function ImGui.Columns(count) end

---@param count integer
---@param id string
function ImGui.Columns(count, id) end

---@param count integer
---@param id string
---@param border boolean
function ImGui.Columns(count, id, border) end

function ImGui.NextColumn() end

---@return integer
function ImGui.GetColumnIndex() end

---@return number
function ImGui.GetColumnWidth() end

---@param column_index integer
---@return number
function ImGui.GetColumnWidth(column_index) end

---@param column_index integer
---@param width number
function ImGui.SetColumnWidth(column_index, width) end

---@return number
function ImGui.GetColumnOffset() end

---@param column_index integer
---@return number
function ImGui.GetColumnOffset(column_index) end

---@param column_index integer
---@param offset_x number
function ImGui.SetColumnOffset(column_index, offset_x) end

---@return integer
function ImGui.GetColumnsCount() end

---@param str_id string
---@return boolean
function ImGui.BeginTabBar(str_id) end

---@param str_id string
---@param flags integer
---@return boolean
function ImGui.BeginTabBar(str_id, flags) end

function ImGui.EndTabBar() end

---@param label string
---@return boolean
function ImGui.BeginTabItem(label) end

---@param label string
---@param flags integer
---@return boolean
function ImGui.BeginTabItem(label, flags) end

---@param label string
---@param open boolean
---@return boolean
---@return boolean
function ImGui.BeginTabItem(label, open) end

---@param label string
---@param open boolean
---@param flags integer
---@return boolean
---@return boolean
function ImGui.BeginTabItem(label, open, flags) end

function ImGui.EndTabItem() end

---@param tab_or_docked_window_label string
function ImGui.SetTabItemClosed(tab_or_docked_window_label) end

function ImGui.BeginDisabled() end

---@param disabled boolean
function ImGui.BeginDisabled(disabled) end

function ImGui.EndDisabled() end

---@param min_x number
---@param min_y number
---@param max_x number
---@param max_y number
---@param intersect_current boolean
function ImGui.PushClipRect(min_x, min_y, max_x, max_y, intersect_current) end

function ImGui.PopClipRect() end

function ImGui.SetItemDefaultFocus() end

function ImGui.SetKeyboardFocusHere() end

---@param offset integer
function ImGui.SetKeyboardFocusHere(offset) end

---@return boolean
function ImGui.IsItemHovered() end

---@param flags integer
---@return boolean
function ImGui.IsItemHovered(flags) end

---@return boolean
function ImGui.IsItemActive() end

---@return boolean
function ImGui.IsItemFocused() end

---@return boolean
function ImGui.IsItemClicked() end

---@param mouse_button integer
---@return boolean
function ImGui.IsItemClicked(mouse_button) end

---@return boolean
function ImGui.IsItemVisible() end

---@return boolean
function ImGui.IsItemEdited() end

---@return boolean
function ImGui.IsItemActivated() end

---@return boolean
function ImGui.IsItemDeactivated() end

---@return boolean
function ImGui.IsItemDeactivatedAfterEdit() end

---@return boolean
function ImGui.IsItemToggledOpen() end

---@return boolean
function ImGui.IsAnyItemHovered() end

---@return boolean
function ImGui.IsAnyItemActive() end

---@return boolean
function ImGui.IsAnyItemFocused() end

---@return number
---@return number
function ImGui.GetItemRectMin() end

---@return number
---@return number
function ImGui.GetItemRectMax() end

---@return number
---@return number
function ImGui.GetItemRectSize() end

function ImGui.SetItemAllowOverlap() end

---@param sizeX number
---@param sizeY number
---@return boolean
function ImGui.IsRectVisible(sizeX, sizeY) end

---@param minX number
---@param minY number
---@param maxX number
---@param maxY number
---@return boolean
function ImGui.IsRectVisible(minX, minY, maxX, maxY) end

---@return number
function ImGui.GetTime() end

---@return integer
function ImGui.GetFrameCount() end

---@return ImDrawList
function ImGui.GetBackgroundDrawList() end

---@return ImDrawList
function ImGui.GetForegroundDrawList() end

---@param idx integer
---@return string
function ImGui.GetStyleColorName(idx) end

---@param id integer
---@param sizeX number
---@param sizeY number
---@return boolean
function ImGui.BeginChildFrame(id, sizeX, sizeY) end

---@param id integer
---@param sizeX number
---@param sizeY number
---@param flags integer
---@return boolean
function ImGui.BeginChildFrame(id, sizeX, sizeY, flags) end

function ImGui.EndChildFrame() end

---@return ImGuiStyle
function ImGui.GetStyle() end

---@param text string
---@return number
---@return number
function ImGui.CalcTextSize(text) end

---@param text string
---@param hide_text_after_double_hash boolean
---@return number
---@return number
function ImGui.CalcTextSize(text, hide_text_after_double_hash) end

---@param text string
---@param hide_text_after_double_hash boolean
---@param wrap_width number
---@return number
---@return number
function ImGui.CalcTextSize(text, hide_text_after_double_hash, wrap_width) end

---@param input integer
---@return table
function ImGui.ColorConvertU32ToFloat4(input) end

---@param rgba table
---@return integer
function ImGui.ColorConvertFloat4ToU32(rgba) end

---@param r number
---@param g number
---@param b number
---@return number
---@return number
---@return number
function ImGui.ColorConvertRGBtoHSV(r, g, b) end

---@param h number
---@param s number
---@param v number
---@return number
---@return number
---@return number
function ImGui.ColorConvertHSVtoRGB(h, s, v) end

---@param min_x number
---@param min_y number
---@param max_x number
---@param max_y number
---@return boolean
function ImGui.IsMouseHoveringRect(min_x, min_y, max_x, max_y) end

---@param min_x number
---@param min_y number
---@param max_x number
---@param max_y number
---@param clip boolean
---@return boolean
function ImGui.IsMouseHoveringRect(min_x, min_y, max_x, max_y, clip) end

---@return number
---@return number
function ImGui.GetMousePos() end

---@return number
---@return number
function ImGui.GetMousePosOnOpeningCurrentPopup() end

---@param button integer
---@return boolean
function ImGui.IsMouseDragging(button) end

---@param button integer
---@param lock_threshold number
---@return boolean
function ImGui.IsMouseDragging(button, lock_threshold) end

---@return number
---@return number
function ImGui.GetMouseDragDelta() end

---@param button integer
---@return number
---@return number
function ImGui.GetMouseDragDelta(button) end

---@param button integer
---@param lock_threshold number
---@return number
---@return number
function ImGui.GetMouseDragDelta(button, lock_threshold) end

function ImGui.ResetMouseDragDelta() end

---@param button integer
function ImGui.ResetMouseDragDelta(button) end

---@return string
function ImGui.GetClipboardText() end

---@param text string
function ImGui.SetClipboardText(text) end

---@param drawlist ImDrawList
---@param p1X number
---@param p1Y number
---@param p2X number
---@param p2Y number
---@param col integer
function ImGui.ImDrawListAddLine(drawlist, p1X, p1Y, p2X, p2Y, col) end

---@param drawlist ImDrawList
---@param p1X number
---@param p1Y number
---@param p2X number
---@param p2Y number
---@param col integer
---@param thickness number
function ImGui.ImDrawListAddLine(drawlist, p1X, p1Y, p2X, p2Y, col, thickness) end

---@param drawlist ImDrawList
---@param p_minX number
---@param p_minY number
---@param p_maxX number
---@param p_maxY number
---@param col integer
function ImGui.ImDrawListAddRect(drawlist, p_minX, p_minY, p_maxX, p_maxY, col) end

---@param drawlist ImDrawList
---@param p_minX number
---@param p_minY number
---@param p_maxX number
---@param p_maxY number
---@param col integer
---@param rounding number
function ImGui.ImDrawListAddRect(drawlist, p_minX, p_minY, p_maxX, p_maxY, col, rounding) end

---@param drawlist ImDrawList
---@param p_minX number
---@param p_minY number
---@param p_maxX number
---@param p_maxY number
---@param col integer
---@param rounding number
---@param flags integer
function ImGui.ImDrawListAddRect(drawlist, p_minX, p_minY, p_maxX, p_maxY, col, rounding, flags) end

---@param drawlist ImDrawList
---@param p_minX number
---@param p_minY number
---@param p_maxX number
---@param p_maxY number
---@param col integer
---@param rounding number
---@param flags integer
---@param thickness number
function ImGui.ImDrawListAddRect(drawlist, p_minX, p_minY, p_maxX, p_maxY, col, rounding, flags, thickness) end

---@param drawlist ImDrawList
---@param p_minX number
---@param p_minY number
---@param p_maxX number
---@param p_maxY number
---@param col integer
function ImGui.ImDrawListAddRectFilled(drawlist, p_minX, p_minY, p_maxX, p_maxY, col) end

---@param drawlist ImDrawList
---@param p_minX number
---@param p_minY number
---@param p_maxX number
---@param p_maxY number
---@param col integer
---@param rounding number
function ImGui.ImDrawListAddRectFilled(drawlist, p_minX, p_minY, p_maxX, p_maxY, col, rounding) end

---@param drawlist ImDrawList
---@param p_minX number
---@param p_minY number
---@param p_maxX number
---@param p_maxY number
---@param col integer
---@param rounding number
---@param flags integer
function ImGui.ImDrawListAddRectFilled(drawlist, p_minX, p_minY, p_maxX, p_maxY, col, rounding, flags) end

---@param drawlist ImDrawList
---@param p_minX number
---@param p_minY number
---@param p_maxX number
---@param p_maxY number
---@param col_upr_left integer
---@param col_upr_right integer
---@param col_bot_right integer
---@param col_bot_left integer
function ImGui.ImDrawListAddRectFilledMultiColor(drawlist, p_minX, p_minY, p_maxX, p_maxY, col_upr_left, col_upr_right,
												 col_bot_right, col_bot_left)
end

---@param drawlist ImDrawList
---@param p1X number
---@param p1Y number
---@param p2X number
---@param p2Y number
---@param p3X number
---@param p3Y number
---@param p4X number
---@param p4Y number
---@param col integer
function ImGui.ImDrawListAddQuad(drawlist, p1X, p1Y, p2X, p2Y, p3X, p3Y, p4X, p4Y, col) end

---@param drawlist ImDrawList
---@param p1X number
---@param p1Y number
---@param p2X number
---@param p2Y number
---@param p3X number
---@param p3Y number
---@param p4X number
---@param p4Y number
---@param col integer
---@param thickness number
function ImGui.ImDrawListAddQuad(drawlist, p1X, p1Y, p2X, p2Y, p3X, p3Y, p4X, p4Y, col, thickness) end

---@param drawlist ImDrawList
---@param p1X number
---@param p1Y number
---@param p2X number
---@param p2Y number
---@param p3X number
---@param p3Y number
---@param p4X number
---@param p4Y number
---@param col integer
function ImGui.ImDrawListAddQuadFilled(drawlist, p1X, p1Y, p2X, p2Y, p3X, p3Y, p4X, p4Y, col) end

---@param drawlist ImDrawList
---@param p1X number
---@param p1Y number
---@param p2X number
---@param p2Y number
---@param p3X number
---@param p3Y number
---@param col integer
function ImGui.ImDrawListAddTriangle(drawlist, p1X, p1Y, p2X, p2Y, p3X, p3Y, col) end

---@param drawlist ImDrawList
---@param p1X number
---@param p1Y number
---@param p2X number
---@param p2Y number
---@param p3X number
---@param p3Y number
---@param col integer
---@param thickness number
function ImGui.ImDrawListAddTriangle(drawlist, p1X, p1Y, p2X, p2Y, p3X, p3Y, col, thickness) end

---@param drawlist ImDrawList
---@param p1X number
---@param p1Y number
---@param p2X number
---@param p2Y number
---@param p3X number
---@param p3Y number
---@param col integer
function ImGui.ImDrawListAddTriangleFilled(drawlist, p1X, p1Y, p2X, p2Y, p3X, p3Y, col) end

---@param drawlist ImDrawList
---@param centerX number
---@param centerY number
---@param radius number
---@param col integer
function ImGui.ImDrawListAddCircle(drawlist, centerX, centerY, radius, col) end

---@param drawlist ImDrawList
---@param centerX number
---@param centerY number
---@param radius number
---@param col integer
---@param num_segments integer
function ImGui.ImDrawListAddCircle(drawlist, centerX, centerY, radius, col, num_segments) end

---@param drawlist ImDrawList
---@param centerX number
---@param centerY number
---@param radius number
---@param col integer
---@param num_segments integer
---@param thickness number
function ImGui.ImDrawListAddCircle(drawlist, centerX, centerY, radius, col, num_segments, thickness) end

---@param drawlist ImDrawList
---@param centerX number
---@param centerY number
---@param radius number
---@param col integer
function ImGui.ImDrawListAddCircleFilled(drawlist, centerX, centerY, radius, col) end

---@param drawlist ImDrawList
---@param centerX number
---@param centerY number
---@param radius number
---@param col integer
---@param num_segments integer
function ImGui.ImDrawListAddCircleFilled(drawlist, centerX, centerY, radius, col, num_segments) end

---@param drawlist ImDrawList
---@param centerX number
---@param centerY number
---@param radius number
---@param col integer
---@param num_segments integer
function ImGui.ImDrawListAddNgon(drawlist, centerX, centerY, radius, col, num_segments) end

---@param drawlist ImDrawList
---@param centerX number
---@param centerY number
---@param radius number
---@param col integer
---@param num_segments integer
---@param thickness number
function ImGui.ImDrawListAddNgon(drawlist, centerX, centerY, radius, col, num_segments, thickness) end

---@param drawlist ImDrawList
---@param centerX number
---@param centerY number
---@param radius number
---@param col integer
---@param num_segments integer
function ImGui.ImDrawListAddNgonFilled(drawlist, centerX, centerY, radius, col, num_segments) end

---@param drawlist ImDrawList
---@param posX number
---@param posY number
---@param col integer
---@param text_begin string
function ImGui.ImDrawListAddText(drawlist, posX, posY, col, text_begin) end

---@param drawlist ImDrawList
---@param font_size number
---@param posX number
---@param posY number
---@param col integer
---@param text_begin string
function ImGui.ImDrawListAddText(drawlist, font_size, posX, posY, col, text_begin) end

---@param drawlist ImDrawList
---@param font_size number
---@param posX number
---@param posY number
---@param col integer
---@param text_begin string
---@param wrap_width number
function ImGui.ImDrawListAddText(drawlist, font_size, posX, posY, col, text_begin, wrap_width) end

---@param drawlist ImDrawList
---@param p1X number
---@param p1Y number
---@param p2X number
---@param p2Y number
---@param p3X number
---@param p3Y number
---@param p4X number
---@param p4Y number
---@param col integer
---@param thickness number
function ImGui.ImDrawListAddBezierCubic(drawlist, p1X, p1Y, p2X, p2Y, p3X, p3Y, p4X, p4Y, col, thickness) end

---@param drawlist ImDrawList
---@param p1X number
---@param p1Y number
---@param p2X number
---@param p2Y number
---@param p3X number
---@param p3Y number
---@param p4X number
---@param p4Y number
---@param col integer
---@param thickness number
---@param num_segments integer
function ImGui.ImDrawListAddBezierCubic(drawlist, p1X, p1Y, p2X, p2Y, p3X, p3Y, p4X, p4Y, col, thickness, num_segments) end

---@param drawlist ImDrawList
---@param p1X number
---@param p1Y number
---@param p2X number
---@param p2Y number
---@param p3X number
---@param p3Y number
---@param col integer
---@param thickness number
function ImGui.ImDrawListAddBezierQuadratic(drawlist, p1X, p1Y, p2X, p2Y, p3X, p3Y, col, thickness) end

---@param drawlist ImDrawList
---@param p1X number
---@param p1Y number
---@param p2X number
---@param p2Y number
---@param p3X number
---@param p3Y number
---@param col integer
---@param thickness number
---@param num_segments integer
function ImGui.ImDrawListAddBezierQuadratic(drawlist, p1X, p1Y, p2X, p2Y, p3X, p3Y, col, thickness, num_segments) end
