{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "k8s-java-hello-world.name" -}}
{{- default .Chart.Name .Values.app.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "k8s-java-hello-world.fullname" -}}
{{- default .Chart.Name .Values.app.instancename | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8s-java-hello-world.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create full image name
*/}}
{{- define "image.fullname" -}}
{{- if .Values.imageConfig.tag -}}
{{- printf "%s:%s" .Values.image .Values.imageConfig.tag -}}
{{- else -}}
{{- .Values.image -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "k8s-java-hello-world.labels" -}}
helm.sh/chart: {{ include "k8s-java-hello-world.chart" . }}
{{ include "k8s-java-hello-world.selectorLabels" . }}
{{- if .Values.imageConfig.tag }}
app.kubernetes.io/version: {{ .Values.imageConfig.tag | quote }}
{{- else }}
app.kubernetes.io/version: undefined
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: {{ .Values.app.partof }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "k8s-java-hello-world.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-java-hello-world.name" . }}
{{- if .Values.app.instancename -}}
app.kubernetes.io/instance: {{ .Values.app.instancename }}
{{- end -}}
{{- end }}