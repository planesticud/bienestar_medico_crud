#!/usr/bin/env bash

set -e
set -u
set -o pipefail

if [ -n "${PARAMETER_STORE:-}" ]; then
  export BIENESTAR_MEDICO_CRUD__PGUSER="$(aws ssm get-parameter --name /${PARAMETER_STORE}/bienestar_medico_crud/db/username --output text --query Parameter.Value)"
  export BIENESTAR_MEDICO_CRUD__PGPASS="$(aws ssm get-parameter --with-decryption --name /${PARAMETER_STORE}/bienestar_medico_crud/db/password --output text --query Parameter.Value)"
fi

exec ./main "$@"
