# Pharmaverse Docker Image

[![Docker Image](https://ghcr-badge.egpl.dev/pharmaverse/docker_pharmaverse/latest_tag?trim=major&label=latest)](https://github.com/pharmaverse/docker_pharmaverse/pkgs/container/docker_pharmaverse)
[![Docker Image Size](https://ghcr-badge.egpl.dev/pharmaverse/docker_pharmaverse/size)](https://github.com/pharmaverse/docker_pharmaverse/pkgs/container/docker_pharmaverse)
[![R Version](https://img.shields.io/badge/R-4.5.1-blue.svg)](https://www.r-project.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-in%20development-orange.svg)](https://github.com/pharmaverse/docker_pharmaverse)

> ⚠️ **DEVELOPMENT STATUS**: This project is currently in active development. Features and APIs may change.

> 🔬 **Docker environment** for pharmaceutical data analysis with all [Pharmaverse](https://pharmaverse.org/) packages pre-installed.

Built on [rocker/tidyverse](https://rocker-project.org/) with 40+ pharmaverse packages for CDISC ADaM/SDTM, clinical trials, and regulatory submissions.

## What's Included

This image includes:

- **Base**: rocker/tidyverse (R, RStudio Server, tidyverse packages, quarto)
- **Pharmaverse Packages**: 40+ packages for pharmaceutical data analysis and reporting

### Pharmaverse Packages

- admiral, admiralmetabolic, admiralneuro, admiralonco, admiralophtha, admiralpeds, admiralvaccine
- cards, cardx
- chevron, clinify, connector, covtracer
- datacutr, datasetjson, diffdf
- ggsurvfit, gridify, gtsummary
- logrx, metacore, metatools
- pharmaRTF, pharmaverseadam, pharmaverseraw, pharmaversesdtm, pkglite
- rhino, riskmetric, rlistings, rtables
- sdtmchecks, teal, teal.modules.clinical, teal.modules.general,, tern, tfrmt, tfrmtbuilder
- tidyCDISC, tidytlg, Tplyr
- whirl, xportr

---

### 1. Pull the Image

**For Production (Reproducible Research):**

```bash
# Pin to exact version - never changes
docker pull ghcr.io/pharmaverse/docker_pharmaverse:v4.5.1
```

**For Development:**

```bash
# Get latest features & updates
docker pull ghcr.io/pharmaverse/docker_pharmaverse:latest
```

💡 **See [VERSIONING.md](VERSIONING.md)** for choosing the right tag.

### 2. Run RStudio Server

```bash
docker run -d \
  -p 8787:8787 \
  -e PASSWORD=yourpassword \
  -v $(pwd):/home/rstudio/workspace \
  ghcr.io/pharmaverse/docker_pharmaverse:v1.0.0
```

Access at: **http://localhost:8787**

- **Username:** `rstudio`
- **Password:** `yourpassword` (what you set above)

### 3. Run R in Terminal

```bash
docker run -it --rm ghcr.io/pharmaverse/docker_pharmaverse:v1.0.0 R
```

### 4. Use with Docker Compose

Create `docker-compose.yml`:

```yaml
version: '3.8'
services:
  rstudio:
    image: ghcr.io/pharmaverse/docker_pharmaverse:v1.0.0
    ports:
      - "8787:8787"
    environment:
      - PASSWORD=yourpassword
    volumes:
      - ./workspace:/home/rstudio/workspace
```

Run:
```bash
docker-compose up -d
```

---

## 🔧 GitHub Codespaces & Dev Containers

### Open in GitHub Codespaces

Click to open this project in a cloud development environment:

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/pharmaverse/docker_pharmaverse)

### Use with VS Code Dev Containers

1. Install [VS Code](https://code.visualstudio.com/) and [Docker Desktop](https://www.docker.com/products/docker-desktop)
2. Install [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
3. Open this repository in VS Code
4. Press `F1` → `Dev Containers: Reopen in Container`

---

## 💻 Building & Development

### Build Locally

```bash
# Clone the repository
git clone https://github.com/pharmaverse/docker_pharmaverse.git
cd docker_pharmaverse

# Build the image
docker build -t pharmaverse:local .

# Run it
docker run -d -p 8787:8787 -e PASSWORD=test pharmaverse:local
```

---

## 🎯 Use Cases

Perfect for:

- ✅ **Pharmaceutical data analysis** - ADaM, SDTM, TLFs
- ✅ **Clinical trial programming** - Regulatory submissions
- ✅ **Reproducible research** - Validated environments
- ✅ **Training & education** - Teaching pharma programming
- ✅ **CI/CD pipelines** - Automated testing & reporting
- ✅ **Collaborative development** - Consistent team environments

---

## 📞 Support & Community

### Getting Help

| Issue Type | Where to Ask |
|------------|--------------|
| 🐛 Docker image issues | [GitHub Issues](https://github.com/pharmaverse/docker_pharmaverse/issues) |
| 📦 R package questions | Individual package repositories |
| 🖥️ RStudio Server | [Rocker Project](https://rocker-project.org/) |
| 💬 General pharmaverse | [Pharmaverse Slack](https://pharmaverse.slack.com/) |

### Useful Links

- 📖 [Pharmaverse Website](https://pharmaverse.org/)
- 🐳 [Rocker Project](https://rocker-project.org/)
- 📦 [CRAN](https://cran.r-project.org/)
- 🎓 [Pharmaverse Examples](https://pharmaverse.github.io/)

---

## 📄 License

This project is licensed under the **Apache 2.0 License** - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **[Rocker Project](https://rocker-project.org/)** - Excellent base R Docker images
- **[Pharmaverse Community](https://pharmaverse.org/)** - Outstanding open-source pharma packages
- **[R Core Team](https://www.r-project.org/)** - The R language
- **All Contributors** - Thank you! 🎉

---

## ⭐ Star This Repository

If you find this useful, please consider giving it a star! It helps others discover the project.

[![GitHub stars](https://img.shields.io/github/stars/pharmaverse/docker_pharmaverse?style=social)](https://github.com/pharmaverse/docker_pharmaverse/stargazers)

---

**Built with ❤️ by the Pharmaverse Community**
