# Contributing to Pharmaverse Docker

Thank you for your interest in contributing to this project!

## How to Contribute

### Adding New Packages

To add new pharmaverse packages to the Docker image:

1. Edit the `Dockerfile`
2. Add the package name to the `install.packages()` call
3. Also add it to the verification step
4. Update the README.md with the new package name
5. Test the build locally
6. Submit a pull request

### Testing Locally

Before submitting a PR, please test the build:

```bash
# Build the image
docker build -t pharmaverse:test .

# Test that it runs
docker run --rm pharmaverse:test R --version

# Test that packages are installed
docker run --rm pharmaverse:test R -e "library(admiral)"
```

### Pull Request Process

1. Fork the repository
2. Create a new branch for your changes
3. Make your changes
4. Test the build locally
5. Submit a pull request with a clear description of changes
6. Wait for review and CI checks to pass

## Code of Conduct

Please be respectful and constructive in all interactions.

## Questions?

Open an issue if you have questions or suggestions!
