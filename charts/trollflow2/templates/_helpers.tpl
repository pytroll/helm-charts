{{- define "trollflow2.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "trollflow2.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "trollflow2.labels" -}}
{{ include "trollflow2.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{- define "trollflow2.selectorLabels" -}}
app: {{ include "trollflow2.fullname" . }}
app.kubernetes.io/name: {{ include "trollflow2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}