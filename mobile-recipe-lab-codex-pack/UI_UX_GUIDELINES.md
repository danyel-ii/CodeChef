# UI / UX Guidelines

## 1. Design goal

The app should feel like a **premium native mobile tool**, not a dense desktop utility.

## 2. Primary navigation

Recommended bottom navigation:
- Home
- Workbench
- Learn
- Library
- Settings

The Workbench is the core screen and should be reachable in one tap.

## 3. Workbench layout

## 3.1 Mobile portrait priority
Default layout should optimize for portrait phone use.

Recommended structure:
1. input card
2. recipe steps card/list
3. output card
4. quick actions dock or floating action button

Avoid three-column or desktop-style pane layouts.

## 3.2 Input card
Should support:
- paste
- clear
- file import
- share-sheet import
- bytes/text mode indicator

## 3.3 Recipe steps
Each step should be a card with:
- operation title
- summary
- parameter chips
- status icon
- expand/collapse
- reorder handle or drag surface
- duplicate/remove/disable actions

Step controls must remain usable with one hand.

## 3.4 Output card
Should support:
- copy
- share
- switch between text/bytes/structured view
- preview truncation notice
- clear formatting state

## 4. Operation browser

Search-first design.

Must include:
- instant search
- category chips
- recent/favorite operations
- example-backed detail view
- “add to recipe” action

Users should not need to know the exact operation name.

## 5. Learning surfaces

Every operation detail view should expose:
- what it does
- when to use it
- gotchas
- example input/output
- related operations

The learning view should be accessible both from search and from each recipe step.

## 6. Generated parameter editing

Parameter editors should be generated from schema.
Use:
- segmented controls for small enums
- switches for booleans
- bottom-sheet pickers for larger enums
- secure text fields for secrets
- inline validation messages

Avoid custom one-off parameter UIs unless the schema model is expanded for everyone.

## 7. Interaction patterns

Preferred:
- swipe to reveal secondary actions
- bottom sheets for detail/edit
- long press for step options
- tap to expand
- drag or move-up/down for reorder
- sticky primary action area near the bottom

Avoid:
- hover-only concepts
- dense nested menus
- precise drag targets
- tiny icon-only actions without labels

## 8. Accessibility

- minimum 44x44 tap targets
- readable font scaling
- clear focus order
- descriptive semantics labels
- strong contrast
- icons not used as the sole meaning carrier
- screen-reader-friendly diagnostics

## 9. Visual language

Use Material 3 as the base, with a restrained custom layer.

Tone:
- technical but approachable
- modern
- clean
- slightly “lab” flavored without going full hacker cliché

Avoid overusing neon/cyber styling.
The app should feel credible and polished.

## 10. Color and state

Use color for:
- success
- warning
- error
- active step
- selected view mode

Do not rely only on color; pair with icons/text.

## 11. Content hierarchy

On any screen, the user should instantly see:
1. current input
2. current recipe
3. current output
4. what action to take next

## 12. Empty states

Examples:
- no recipe yet → suggest common starter operations
- no saved recipes → show templates/examples
- search empty → suggest nearby operations and tags

## 13. Error states

Errors should:
- identify which step failed
- explain what was expected
- suggest recovery
- keep the rest of the recipe visible when possible

Do not show generic modal-only failures for normal validation errors.

## 14. Performance feel

The UI must feel immediate.

Techniques:
- optimistic step insertion
- debounced preview where appropriate
- visible progress for long tasks
- cancellation affordance
- avoid full-screen blockers unless necessary

## 15. Mobile polish details

- support keyboard-aware layouts
- maintain scroll position sensibly
- preserve draft input when switching tabs
- animate step expand/collapse smoothly
- use tactile, stable motion
- avoid layout shifts when diagnostics appear

## 16. Anti-patterns

Do not:
- recreate a desktop three-pane tool
- force users into landscape for core flows
- hide critical actions in overflow only
- require multiple taps to discover operation explanations
- make byte/text mode ambiguous
