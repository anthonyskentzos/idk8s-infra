{{- define "web.name" -}}
web
{{- end -}}

{{- define "web.fullname" -}}
{{ .Release.Name }}-{{ include "web.name" . }}
{{- end -}}