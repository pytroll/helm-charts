{{- define "segment-gatherer.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "segment-gatherer.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "segment-gatherer.labels" -}}
{{ include "segment-gatherer.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{- define "segment-gatherer.selectorLabels" -}}
app: {{ include "segment-gatherer.fullname" . }}
app.kubernetes.io/name: {{ include "segment-gatherer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}