{{- define "apiv1.name" -}}
apiv1
{{- end -}}

{{- define "apiv1.fullname" -}}
{{ .Release.Name }}-{{ include "apiv1.name" . }}
{{- end -}}