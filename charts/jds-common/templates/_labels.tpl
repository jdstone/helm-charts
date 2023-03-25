{{/* vim: set filetype=mustache: */}}

{{/*
Kubernetes standard labels
*/}}
{{- define "jds-common.labels.standard" -}}
helm.sh/chart: {{ include "jds-common.names.chart" . }}
{{ include "jds-common.lables.selector" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Kubernetes selector labels
*/}}
{{- define "jds-common.lables.selector" -}}
app.kubernetes.io/name: {{ include "jds-common.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
