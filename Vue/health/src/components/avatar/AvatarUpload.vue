<template>
  <div>
    <input type="file" @change="handleFileChange">
    <img :src="imageUrl" v-if="imageUrl">
  </div>
</template>

<script>
export default {
  name: 'AvatarUpload',
  data() {
    return {
      imageUrl: null
    };
  },
  methods: {
    handleFileChange(event) {
      const file = event.target.files[0];
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => {
        this.imageUrl = reader.result;
      };
    }
  },
  watch: {
    imageUrl(newValue) {
      this.$emit('input', newValue);
    }
  }
};
</script>

<style>
/* 样式代码 */
</style>