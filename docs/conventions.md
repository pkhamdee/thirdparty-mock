# Conventions for thirdparty-mock

What the code does not tell you at a glance. Moved here from pkhamdee/modernapp's `docs/agents/conventions.md` when
thirdparty-mock got its own repository (ADR 0009); the system-wide conventions (local environment, deploy, human-only
steps) are still there.

- Node 24 runs `src/*.ts` directly (type stripping): no build step, imports end in `.ts`, `erasableSyntaxOnly`,
  so no enums or parameter properties.
- One Router per mocked party in `src/<party>.ts`, mounted in `src/app.ts`; ID Verification and Credit Check sit
  behind `simulatedDelay`, SMS does not. HTML links must be relative (served under `/thirdparty-mock/`). State is
  in memory, one replica. Test ID numbers (outcome by last two digits) are in `src/testIdNumbers.ts`; the 30-day
  re-apply wait follows the ID number, so use a fresh prefix per demo run.
- Its manifests stay in pkhamdee/modernapp (`../modernapp/deploy/thirdparty/thirdparty-mock/`), with its own Flux
  image automation: the newest `main-<sha>-<ts>` image from this repository is deployed to `thirdparty`.
