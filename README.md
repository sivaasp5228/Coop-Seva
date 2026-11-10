# Demo UI — SIH Cooperative Digital Workforce Platform

This is a Flutter visual prototype built from the supplied SIH UI design PPT.

## Important

The current version is deliberately **visual-first**:
- The supplied PPT screen artwork is preserved as image assets.
- Transparent Flutter hotspots make the screens clickable.
- Navigation demonstrates the intended SIH flow.
- No backend, Firebase, payment gateway, or external map API is required for this first demo.

This approach keeps the first demo extremely close to the supplied PPT.

## Main flow

Home
→ Services
→ Find Workers
→ Worker Profile
→ Booking
→ Booking Confirmation

Additional screens:
- Worker Dashboard
- Cooperative Dashboard
- AI Demand Forecast

## Run

1. Install Flutter.
2. Open this folder in VS Code / Android Studio.
3. If platform folders are not present, run:

```bash
flutter create .
```

4. Then:

```bash
flutter pub get
flutter run
```

## Next implementation phase

The screenshot-backed UI can then be progressively replaced with native Flutter widgets while preserving the exact visual measurements. The map can be connected to a real map provider once an API/provider choice is made.
