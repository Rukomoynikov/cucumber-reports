<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: "Table",
  props: {
    files: {
      type: Array,
      required: true,
    },
  }
})
</script>

<template>
  <div class="table">
    <div class="tableHeader">
      <div class="tableHeader__cell table__cell--title">Step title</div>
      <!-- <div class="tableHeader__cell table__cell--arguments">Arguments</div> -->
    </div>

    <div class="tableBody">
      <div class="file" v-for="file in files">
        <div class="file__name">{{file.file}}</div>
        <div class="steps">
          <div class="step" v-for="step in file.steps">
            <div class="step__cell table__cell--title">{{step.title}}</div>
            <!-- <div class="step__cell table__cell--arguments arguments">
              <div class="arguments__block" v-for="argument in step.arguments">{{argument}}</div>
            </div> -->
          </div>
        </div>
      </div>
    </div>    
  </div>
</template>


<style type="text/css">
.table {
  margin-left: 8px;
}

.table__cell--title {
  flex: 1;
  max-width: 640px;
  margin-right: 16px;
}
.table__cell--arguments {
  flex: 1;
  max-width: 300px;
  overflow-x: hidden;
}

.tableHeader {
  display: flex;
}

.tableHeader__cell {
  font-weight: bold;  
}

.tableBody {
  margin-top: 16px;
}

.step {
  display: flex;
}

.step__cell {
  line-height: 21px;
}

.step:not(:last-of-type) {
  margin-bottom: 8px;
}

.file {
  margin-top: 14px;
}

.file__name + .steps {
  margin-top: 7px;
}

.arguments {
  display: flex;
}

.arguments__block {
  margin-right: 4px;
}

.file__name {
  position: sticky;
  color: #767676;
  font-size: 14px;
  padding: 2px 8px;
  background: white;
  border-radius: 4px;
  display: inline-block;
}
</style>
