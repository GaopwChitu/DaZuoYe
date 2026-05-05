<template>
  <div>
    <quill-editor v-model="innerContent" ref="myQuillEditor" class="editor" :options="editorOption" @blur="onEditorBlur"
      @focus="onEditorFocus" @change="onEditorChange" style="margin-bottom: 10px;" />
  </div>
</template>

<script>
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
import { quillEditor } from 'vue-quill-editor'

export default {
  components: { quillEditor },
  props: {
    value: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      innerContent: '',
      editorOption: {
        modules: {
          toolbar: [
            ['bold', 'italic', 'underline', 'strike'],
            ['blockquote', 'code-block'],
            [{ 'header': 1 }, { 'header': 2 }],
            [{ 'list': 'ordered' }, { 'list': 'bullet' }],
            [{ 'color': [] }, { 'background': [] }],
            ['link', 'image'],
            ['clean']
          ]
        },
        placeholder: '请输入内容...'
      }
    }
  },
  watch: {
    value(newVal) {
      this.innerContent = newVal
    }
  },
  methods: {
    onEditorBlur() {
      this.$emit('input', this.innerContent)
    },
    onEditorFocus() { },
    onEditorChange() {
      this.$emit('input', this.innerContent)
    }
  }
}
</script>

<style scoped>
.editor {
  height: 400px;
  line-height: normal !important;
}
</style>