<template>
  <div>
    <v-card>
    <div class="cv_header padding-top-mn" >กลุ่มการเรียน</div>
    <!-- <div class="cv_header xs12">
      <v-btn
        color="green lighten-2"
        dark
        small
        absolute
        top
        right
        fab
        @click="group_add()"
      >
        <v-icon>add</v-icon>
      </v-btn>
    </div> -->
    <v-spacer></v-spacer>
  <v-data-table
      :headers="headers"
      :items="group"
      :search="search"
      :pagination.sync="pagination"
      :loading=state
      prev-icon="fas fa-chevron-circle-left"
      next-icon="fas fa-chevron-circle-right"
      sort-icon="mdi-menu-down"
      rows-per-page-text="แสดง"
      :rows-per-page-items=rows_per_page
    >
    <template slot="headerCell" slot-scope="props">
      <v-tooltip bottom>
        <span slot="activator">
          {{ props.header.text }}
        </span>
        <span>
          {{ props.header.text }}
        </span>
      </v-tooltip>
    </template>
    <template slot="items" slot-scope="props">
      <tr v-on:click="list_group(props.item.g_id)">
        <td class="text-xs-left">{{ props.item.g_code }}</td>
        <td class="text-xs-left">{{ props.item.g_name }}</td>
        <td class="text-xs-left">{{ props.item.d_name }}</td>

      </tr>
    </template>
     <template slot="no-data">
        <v-alert :value="true" color="error" icon="warning">
          ไม่พบข้อมูล :(
        </v-alert>
      </template>
  </v-data-table>
    </v-card>
  </div>
</template>

<script>
  export default {
    layout: 'teacher',
    data () {
      return {
        state:false,
        search: '',
        pagination: {},
        selected: [],
        rows_per_page:[10,20,{"text":"แสดงทั้งหมด","value":-1}],//////////////////////////   teach me pleas!
        headers: [
          { text: 'รหัสกลุ่มการเรียน', value: 'รหัสกลุ่มการเรียน',align: 'left',sortable: false, },
          { text: 'ชื่อกลุ่มการเรียน', value: 'ชื่อกลุ่มการเรียน',align: 'left',sortable: false, },
          { text: 'รหัสแผนก', value: 'รหัสแผนก',align: 'left',sortable: false,  },
        ],
        group: []
      }
    },
    async created(){
      this.state=true
      let res=await this.$http.post('/group/list_teacher?t_id=',{
        t_id:sessionStorage.getItem("id")
      })
      //  console.log(res.data)
      this.group=res.data.datas
      // console.log("num=".res.data.num)
      this.state=false
    },
    computed: {
      pages () {
        if (this.pagination.rowsPerPage == null || this.pagination.totalItems == null) return 0
        return Math.ceil(this.pagination.totalItems / this.pagination.rowsPerPage)
      }
    },
    methods:{
      list_group(g_id){
        // this.$router.replace('../teacher/group/group_edit?g_id='+g_id)
        this.$router.push({path: '../teacher/group/group_edit?g_id='+g_id})
      },
      group_add(){
        this.$router.push({path:"../teacher/group/add_group"})
      }
     
    }
  }
</script>