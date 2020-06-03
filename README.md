# README

## Todo

- [ ] i18n
- [ ] GitHub Action workflow
- [ ] Kubernetes deployment

## Environment variables

```
DATABASE_URL=
DO_SPACES_KEY=
DO_SPACES_SECRET=
REDIS_URL=
RAILS_ENV=production
```

## Secrets

```
kubectl create secret generic pine --from-env-file=.env
```
