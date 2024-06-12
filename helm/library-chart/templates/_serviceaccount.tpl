{{- define "library-chart.createSA" -}}
{{- if .Values.serviceAccount -}}
  {{- if .Values.serviceAccount.create -}}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ include "library-chart.serviceAccountName" . }}
  labels:
    {{- include "library-chart.labels" . | nindent 4 }}
  {{- with .Values.serviceAccount.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
automountServiceAccountToken: {{ .Values.serviceAccount.automount }}
  {{- end }}
{{- end }}
{{- end }}