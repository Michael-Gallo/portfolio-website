# Portfolio Website
This is the source for my personal website which can be found at https://michaelgallo.dev . Changes made to the master branch of this repository are automatically deployed to GCP and updated on the web through a CI/CD pipeline.  Changes are automatically mirrored into GCP Cloud Source Repositories which triggers a Cloud Build to create a Docker image which is then deployed serverlessly with Cloud Run.


# Technologies used
- GCP
  - Cloud Source Repositories
  - Cloud Build
  - Cloud Run
- Gitlab
  - Repository Mirroring
- Nginx
- Docker