<script lang="ts">
import {ref, computed} from "vue"

interface File {
  file: string;
  steps: [Step];
}

interface Step {
  title:     string;
  arguments: string[];
}

export default function useStepsFilterTitleSearch(files: [File]) {
  let searchQuery = ref<String>("")

  const formFilterHandler = (value: String) => {
    searchQuery.value = value
  }

  const stepsMatchingSearchQuery = computed(() => {
    return files
    // const filteredFiles = files.value.filter(file: File => {
    //   return file.steps.filter(steps => {

    //   })
    // })

    // return filteredFiles
  })

  return {
    searchQuery,
    formFilterHandler,
    stepsMatchingSearchQuery
  }
}
</script>
