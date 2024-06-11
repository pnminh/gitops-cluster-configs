{{- define "library-chart.createSecret" -}}
{{- $secret := .secret -}}
{{- $root := .root -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ $secret.name }}
  labels:
    {{- include "library-chart.labels" $root | nindent 8 }}
type: {{ $secret.type | default "Opaque" }}
data:
  {{- range $key, $value := $secret.data }}
  {{ $key }}: {{ $value | b64enc }}
  {{- end }}
{{- end }}