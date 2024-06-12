{{- define "library-chart.createSA" -}}
{{- $root := .root -}}
{{- if $root.serviceAccount -}}
  {{- if $root.serviceAccount.create -}}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ include "library-chart.serviceAccountName" $root }}
  labels:
    {{- include "library-chart.labels" $root | nindent 4 }}
  {{- with $root.serviceAccount.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
automountServiceAccountToken: {{ $root.serviceAccount.automount }}
  {{- end }}
{{- end }}
{{- end }}