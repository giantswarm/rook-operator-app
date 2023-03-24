{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Create chart name and version as used by the chart label. */}}
{{- define "chart.version" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Define imagePullSecrets option to pass to all service accounts
*/}}
{{- define "imagePullSecrets" }}
{{- if .Values.imagePullSecrets -}}
imagePullSecrets:
{{ toYaml .Values.imagePullSecrets }}
{{- end -}}
{{- end -}}

{{- define "chart.defaultLabels" -}}
app.kubernetes.io/managed-by: "{{ .Release.Service }}"
helm.sh/chart: "{{ template "chart.version" . }}"
giantswarm.io/service-type: "managed"
application.giantswarm.io/team: {{ index .Chart.Annotations "application.giantswarm.io/team" | quote }}
{{- end -}}
