# Project Improvement Plan - Rails Audit & Optimization

## 1. Current Project Analysis

The project is a standard Rails 7 application using modern tools like Hotwire (Turbo/Stimulus), Tailwind CSS, and ViewComponent. However, several key areas for improvement were identified during the initial audit:

*   **Database Integrity:** Model-level uniqueness validations exist for `Post#title`, but there is no corresponding unique index in the database. This can lead to race conditions and data inconsistency.
*   **Testing Infrastructure:** There is a complete lack of automated tests (no RSpec or Minitest suite).
*   **Code Quality & Linting:** No linting tools (like RuboCop) are configured, leading to potential inconsistencies in code style.
*   **Component Robustness:** The `TurboModalComponent` lacks input validation and advanced user interaction features (like closing on the 'Escape' key).
*   **Dependency Management:** The `Gemfile` is missing essential development and testing libraries.

---

## 2. Recommended Improvements

### Phase 1: Environment & Tooling
- [x] Update `Gemfile` with `rspec-rails`, `factory_bot_rails`, `faker`, and `rubocop-rails`.
- [x] Configure `.rubocop.yml` with Rails-specific rules.
- [x] Initialize RSpec for the project.

### Phase 2: Database & Data Integrity
- [x] Add a unique index to `posts.title` via a database migration.

### Phase 3: Testing & Quality Assurance
- [x] Implement model specs for `Post`.
- [x] Implement request specs for `PostsController`.
- [x] Run RuboCop auto-corrections to standardize the codebase.

### Phase 4: Frontend & Components
- [x] Add attribute validation to `TurboModalComponent`.
- [x] Enhance `turbo_modal_controller.js` with 'Escape' key support for better UX.

---

## 3. Implementation Steps & Tracking

| Step | Task | Status |
| :--- | :--- | :--- |
| 1 | Create Improvement Plan | ✅ Done |
| 2 | Update Gemfile & Install Dependencies | ✅ Done |
| 3 | Configure RuboCop | ✅ Done |
| 4 | Add Unique Index Migration | ✅ Done |
| 5 | Initialize RSpec | ✅ Done |
| 6 | Add Model & Request Specs | ✅ Done |
| 7 | Refactor TurboModalComponent & JS | ✅ Done |
| 8 | Run Linting & Final Test Suite | ✅ Done |
| 9 | Final Review & Submission | ✅ Done |
