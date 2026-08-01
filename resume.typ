// Michael P. Porter — résumé
// Build:  typst compile resume.typ resume.pdf
// CI passes a short commit sha:  --input version=abc1234

#let version = sys.inputs.at("version", default: "local")

//============================================================
//  DATA
//============================================================

#let name     = "Michael Porter"
#let jobtitle = "Lead DevOps Engineer"
#let location = "New York, NY"
#let website  = "https://www.michaelpporter.com"

#let about = [
  Decisive, knowledgeable, and tenacious DevOps Engineer who exemplifies
  _Kaizen_ — a passion for continual improvement and efficiency. A highly
  valued problem-solver and a change leader.
]

#let skills = (
  "Jenkins", "ArgoCD", "Concourse", "Kargo", "Kubernetes",
  "Terraform", "Helm", "GCP", "GitHub Actions",
)

#let experience = (
  (
    dates: "2019 – present", org: "Paramount Streaming", role: "Sr. → Lead DevOps Engineer",
    desc: [Promoted from Senior to Lead on the streaming DevSecOps team; own the
      Paramount+ CI/CD and GitOps platforms end-to-end while supporting the
      Pluto TV pipelines. Drive Jenkins (shared libraries, Kubernetes build agents,
      Job DSL) orchestrating *[X]+ multi-region deployment pipelines* across
      *[Y] services*, alongside ArgoCD GitOps (ApplicationSets, sync-window code
      freezes, RBAC), Concourse pipeline-as-code, and Kargo progressive delivery
      — cutting median deploy time by *[Z]%* and reducing failed-deploy rollbacks
      by *[Z]%*. Migrated Jenkins controllers and workloads onto a consolidated
      GKE streaming-tools cluster, cutting infra spend by *[\$X]/mo*, and
      prototyped ArgoCD federation to Oracle OKE via OIDC / Workload Identity.
      Provision infrastructure with Terraform on GCP; embed security into
      delivery with image signing, SBOMs, External Secrets Operator,
      least-privilege service accounts, and Renovate dependency automation,
      resolving *[X]+ vulnerable dependencies/quarter* automatically.],
  ),
  (
    dates: "2019", org: "Signafire", role: "DevOps Engineer",
    desc: [Established DevOps practices: migrated monitoring to Sensu with
      Grafana/Graphite dashboards covering *[X] hosts/services*, built Ansible
      roles for custom Node and Clojure apps, and authored reusable
      Terraform/Terragrunt modules cutting new-environment provisioning time
      from *[X] days to [Y] hours*. Implemented JumpCloud LDAP across JIRA,
      Confluence, GSuite, and GitLab for *[X] users*.],
  ),
  (
    dates: "2013 – 2019", org: "Xeno Media", role: "Lead Developer",
    desc: [Developed, promoted, and maintained a CI/CD workflow with GitHub,
      Jenkins, and commit-based Behat testing on full LAMP stacks (DigitalOcean
      hosted), cutting release cycle time from *[X] to [Y]* and catching
      *[Z]%* of regressions pre-deploy. Created Ansible playbooks for server
      builds, reducing new-server setup from *[X] hours to [Y] minutes*.
      Adapted Docker4Drupal with custom robo.li commands for single-command
      startup. Linked JIRA, GitHub, and Jenkins to Slack. Built Drupal modules
      for client projects, including CSV and Salesforce import, serving
      *[X]+ client sites*.],
  ),
  (
    dates: "2008 – 2013", org: "Duo Consulting", role: "Drupal Maintenance / Operations Developer",
    desc: [Maintained and tuned performance for *[X]+* hosted Drupal sites —
      troubleshooting, slow-query analysis, and query optimization —
      improving average page load times by *[Z]%*, and built new modules with
      project managers and clients.],
  ),
  (
    dates: "2006 – 2008", org: "Vitaltype", role: "Lead Developer",
    desc: [Architected a HIPAA-compliant medical transcription system serving
      *[X]+* users; migrated it from a ColdFusion / SQL Server application to
      Flex on AWS (EC2, RDS) using LiveCycle Data Services, improving
      turnaround time by *[Z]%*.],
  ),
)

#let contributions = (
  (dates: "2019", org: "Sensu-Ansible", role: "Contributor",
   desc: [Updated Ansible from 2.3 to 2.7, fixing tags. Namespaced variables to
     the `sensu` prefix. Fixed Galaxy linting issues.]),
  (dates: "2017", org: "DrupalCamp", role: "Speaker",
   desc: [Using Jenkins with Drupal.]),
  (dates: "2017", org: "MidCamp", role: "Speaker",
   desc: [Automating Drupal with Jenkins.]),
)

//============================================================
//  STYLE
//============================================================

#let accent = rgb("#1f6feb")
#let muted  = rgb("#5b6470")

#set document(title: name + " — Résumé", author: name)
#set page(
  paper: "us-letter",
  margin: (x: 1.7cm, top: 1.0cm, bottom: 0.8cm),
  footer: context [
    #set text(size: 7.5pt, fill: muted)
    #name #h(1fr) #version
  ],
)
#set text(size: 10pt, fill: rgb("#1c2128"))
#set par(justify: true, leading: 0.58em)

// Section heading: accent label + hairline rule
#let section(title) = {
  v(0.15em)
  block(below: 0.3em)[
    #text(size: 11pt, weight: "bold", fill: accent, tracking: 0.06em)[
      #upper(title)
    ]
    #v(0.15em)
    #line(length: 100%, stroke: 0.6pt + accent.lighten(40%))
  ]
}

// Skill pill
#let pill(s) = box(
  fill: accent.lighten(86%),
  inset: (x: 7pt, y: 3pt),
  radius: 3pt,
  text(size: 9pt, fill: accent.darken(10%))[#s],
)

// One experience / contribution entry
#let entry(dates, org, role, desc) = block(below: 0.4em)[
  #grid(
    columns: (3.4cm, 1fr),
    gutter: 0.6em,
    [#text(size: 9pt, fill: muted)[#dates]],
    [
      #text(weight: "bold")[#org] #h(0.4em)
      #text(fill: muted)[· #role]
      #v(0.15em)
      #text(size: 9.5pt)[#desc]
    ],
  )
]

//============================================================
//  HEADER
//============================================================

#text(size: 26pt, weight: "bold")[#name]
#v(-0.3em)
#text(size: 13pt, fill: accent, weight: "medium")[#jobtitle]
#v(0.2em)
#text(size: 9pt, fill: muted)[
  #location #h(0.6em) · #h(0.6em) #link(website)[#website.replace("https://", "")]
]

#v(0.4em)
#about

//============================================================
//  BODY
//============================================================

#section("Skills")
#{
  set par(justify: false, leading: 0.85em)
  skills.map(pill).join([ ])
}

#section("Experience")
#for e in experience { entry(e.dates, e.org, e.role, e.desc) }

#section("Professional Contributions")
#for c in contributions { entry(c.dates, c.org, c.role, c.desc) }
