<template>
  <div>
    <v-card>
    <h2 align="center" class="padding-top-mn">บันทึกการทำงาน</h2>
    <div class="cv_header">ข้อมูลนักเรียน / นักศึกษา</div>
  <v-data-table
      :headers="headers"
      :items="datas"
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
      <tr v-on:click="log_student_show(props.item.std_id)">
        <td class="text-xs-center">{{ props.item.count }}</td>
        <td class="text-xs-left">{{ props.item.std_code }}</td>
        <td class="text-xs-left">{{ props.item.std_prename }}{{ props.item.std_name }}{{ props.item.std_lname }}</td>
        <td class="text-xs-left">{{ props.item.g_name }}</td>
        <td class="text-xs-left">{{ props.item.d_name }}</td>
        <td class="text-xs-left">{{ props.item.u_name }}</td>

      </tr>
    </template>
     <template slot="no-data">
        <v-alert :value="true" color="error" icon="warning">
         (-_-!) ไม่พบข้อมูล 
        </v-alert>
      </template>
  </v-data-table>
    </v-card>
  </div>
</template>

<script>

  export default {
    
    layout: 'manage',
    data () {
      return {

        state:false,
        search: '',
        pagination: {},
        selected: [],
        rows_per_page:[10,20,{"text":"แสดงทั้งหมด","value":-1}],//////////////////////////   teach me pleas!
        headers: [
          { text: 'การทำงาน', value: 'การทำงาน',align: 'center',sortable: false,  },
          { text: 'รหัสนักเรียน/นักศึกษา', value: 'รหัสนักเรียน/นักศึกษา',align: 'left',sortable: false,  },
          { text: 'ชื่อนักเรียน/นักศึกษา', value: 'ชื่อนักเรียน/นักศึกษา',align: 'left',sortable: false,  },
          { text: 'กลุ่มการเรียน', value: 'กลุ่มการเรียน',align: 'left',sortable: false,  },
          { text: 'แผนกวิชา', value: 'แผนกวิชา',align: 'left',sortable: false,  },
          { text: 'ผู้ดำเนินการ', value: 'ผู้ดำเนินการ',align: 'left',sortable: false,  },
          
        ],
        datas: []
      }
    },
    async created(){
      this.state=true
      let res=await this.$http.get('/log_list/log_student')
      //  console.log(res.data)
      this.datas=res.data.datas
      this.state=false
    },
    computed: {
      pages () {
        if (this.pagination.rowsPerPage == null || this.pagination.totalItems == null) return 0
        return Math.ceil(this.pagination.totalItems / this.pagination.rowsPerPage)
      },
      
    },
    methods:{
      log_student_show(std_id){
        this.$router.push({path: '../student_log/show_log_student?std_id='+std_id})
      },
     
    }
  }
</script>