{{/*
Expand the name of the chart.
*/}}
{{- define "novu.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "novu.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "novu.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "novu.labels" -}}
helm.sh/chart: {{ include "novu.chart" . }}
{{ include "novu.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "novu.selectorLabels" -}}
app.kubernetes.io/name: {{ include "novu.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "novu.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "novu.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Generate the full name of the api component.
*/}}
{{- define "novu.api.fullname" -}}
{{- printf "%s-%s" (include "novu.fullname" .) "api" -}}
{{- end -}}

{{/*
Generate the full name of the web component.
*/}}
{{- define "novu.web.fullname" -}}
{{- printf "%s-%s" (include "novu.fullname" .) "web" -}}
{{- end -}}

{{/*
Generate the full name of the worker component.
*/}}
{{- define "novu.worker.fullname" -}}
{{- printf "%s-%s" (include "novu.fullname" .) "worker" -}}
{{- end -}}

{{/*
Generate the full name of the worker component.
*/}}
{{- define "novu.ws.fullname" -}}
{{- printf "%s-%s" (include "novu.fullname" .) "ws" -}}
{{- end -}}

{{/*
Generate the full name of the redis component.
*/}}
{{- define "redis.fullname" -}}
{{- printf "%s-%s" (include "novu.fullname" .) "redis" -}}
{{- end -}}

{{/*
Generate the full name of the mongodb component.
*/}}
{{- define "mongodb.fullname" -}}
{{- printf "%s-%s" (include "novu.fullname" .) "mongodb" -}}
{{- end -}}
