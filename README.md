# 30-days-of-terraform

![Cover Pic](images/coverpic.JPG)


> *Building real infrastructure. Documenting every step. Landing the role.*

---

## 👋 Who Am I?

I'm a DevOps engineer in active pursuit of my next role, and I believe the best way to prove what I can do is to simply **do it — in public**.

This repository is my 30-day commitment to going deep on Terraform: not just following tutorials, but building real infrastructure, breaking things, fixing them, and understanding *why* everything works the way it does.

---

## 🎯 Why This Challenge?

Infrastructure as Code is no longer a nice-to-have skill — it's the baseline expectation for any serious DevOps or Platform Engineering role. Terraform, in particular, has become the industry standard for provisioning cloud infrastructure across AWS, GCP, and Azure.

I started this challenge for three reasons:

1. **Depth over breadth.** I've touched Terraform before, but I want to move from "I've used it" to "I can architect, scale, and maintain it in production."
2. **A portfolio that shows, not tells.** Every folder in this repo is a real artefact — runnable code, real deployments, real outputs. Not slides. Not certificates. Actual infrastructure.
3. **Building in public keeps me accountable.** Committing to 30 days of documented progress means I can't cut corners or skip the hard parts.

---

## 🏁 What I Hope to Gain

By the end of Day 30, my goal is to be able to:

- ✅ Write and structure production-grade Terraform from scratch
- ✅ Build reusable, composable modules following community best practices
- ✅ Manage remote state securely with locking and versioning
- ✅ Provision real cloud infrastructure across multiple environments (dev/staging/prod)
- ✅ Integrate Terraform into CI/CD pipelines with automated `plan` and `apply`
- ✅ Debug, refactor, and reason through infrastructure problems confidently
- ✅ Have a capstone project I'm proud to walk through in any technical interview

---

## 📁 Repository Structure

```
30-days-of-terraform/
│
├── README.md               ← You are here
│
├── day-01/                 ← Your first provider & resource
├── day-02/                 ← Variables, outputs, tfvars
├── day-03/                 ← State management basics
├── ...
├── day-29/
└── day-30/                 ← Capstone project
    └── README.md           ← Capstone write-up & architecture diagram
```

Each day folder contains:
- `main.tf` — the core infrastructure code
- `variables.tf` / `outputs.tf` — where applicable
- `README.md` — what I built, what I learned, what broke

---

## 📅 The Roadmap

| Week | Focus | Days |
|------|-------|------|
| **Week 1** | Core Foundations | Providers, resources, state, variables, outputs, first real deployment |
| **Week 2** | Real-World Patterns | Modules, remote state (S3 + DynamoDB), workspaces, data sources |
| **Week 3** | Production Thinking | Multi-env tfvars, `for_each`, `count`, conditionals, Terraform Cloud |
| **Week 4** | Capstone Build | End-to-end project: 3-tier AWS architecture + CI/CD pipeline |

---

## 📝 Daily Write-Ups

Every day's work is documented on **Dev.to**. Each post covers what I built, the concept behind it, any errors I hit, and how I resolved them.

> 📖 Follow the full series here: **[Dev.to — @mj16](#)** *(link updated as posts go live)*

---

## 🛠️ Tech Stack

- **IaC Tool:** Terraform (HashiCorp)
- **Cloud Provider:** AWS (primary)
- **State Backend:** S3 + DynamoDB
- **CI/CD:** GitHub Actions
- **Documentation:** Dev.to + this repo

---


<div align="center">

*30 days. 30 commits. One engineer levelling up.*

⭐ **Star this repo if you find it useful — it helps more than you know.**

</div>
