# README

## Environment variables

```
DATABASE_URL=
DO_SPACES_KEY=
DO_SPACES_SECRET=
```

## Secrets

```
kubectl create secret generic pine --from-env-file=.env
```
