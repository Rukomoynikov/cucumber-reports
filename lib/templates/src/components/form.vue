<template>
  <form class="form">
    <input 
      v-on:input="search"
      type="text" 
      name="search" 
      placeholder="User opens a page" 
      class="form__searchInput">
    <div class="form__caption">49 step definitions</div>
  </form>  
</template>

<script lang="ts">
import { defineComponent } from 'vue'

interface SearchForm {
  timer: null | number;
}

export default defineComponent({
  name: "Form",
  data() {
    return {
      timer: null
    } as SearchForm
  },
  methods: {
    search(event: KeyboardEvent) {
      if (this.timer) {clearTimeout(this.timer)}

      this.timer = setTimeout(() => {
        let element = event.target as HTMLInputElement
        this.$emit("filter", element.value)
      }, 300)
    }
  }
})
</script>

<style type="text/css">
.form {
  margin-bottom: 42px;
}

.form__searchInput {
  max-width: 440px;
  width: 100%;
  border-radius: 4px;
  height: 32px;
  border: 0;
  font-size: 16px;
  padding-left: 8px;
}

.form__caption {
  padding-left: 8px;
  font-size: 12px;
  color: rgba(0, 0, 0, 58%);
  margin-top: 3px;
}
</style>
