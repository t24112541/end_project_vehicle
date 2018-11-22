<template>
  <div>
    <v-alert
        v-model="danger"
        dismissible
        :type=type_api
      >
        {{alt_txt}}
      </v-alert>
    <v-card >
    <h2 align="center" class="padding-top-mn">บันทึกการทำงาน</h2>
    <div class="cv_header ">กลุ่มการเรียน {{g_name}} ประจำแผนกวิชา {{d_name}}</div>
    <div class="cv_header ">ชื่อ {{std_prename}}{{std_name}}  {{std_lname}}</div>

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
        
        <td class="text-xs-left">{{ props.item.std_log_work }}</td>
        <td class="text-xs-left">{{ props.item.std_log_date }}</td>
        <td class="text-xs-left">{{ props.item.std_code }}</td>
        <td class="text-xs-left">{{ props.item.std_gender }}</td>
        <td class="text-xs-left">{{ props.item.std_prename }}{{ props.item.std_name }}&nbsp;{{ props.item.std_lname }}</td>
        <td class="text-xs-left">{{ props.item.std_pin_id }}</td>
        <td class="text-xs-left">{{ props.item.std_birthday }}</td>
        <td class="text-xs-left">{{ props.item.std_blood }}</td>
        <td class="text-xs-left">{{ props.item.std_username }}</td>
        <td class="text-xs-left">{{ props.item.std_password }}</td>
        <td class="text-xs-left">{{ props.item.g_name }}</td>
        <td class="text-xs-left">{{ props.item.d_name }}</td>
        <td class="text-xs-left">{{ props.item.u_name }}</td>
        <td class="text-xs-left">
          <v-flex>
              <v-btn flat icon color="green" v-on:click="restore(props.item.run_id)">
                <i class="fas fa-undo-alt"></i>
              </v-btn>
            </v-flex>
          </td>

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
        danger:false,
        std_prename:"",
        std_name:"",
        std_lname:"",
        g_name:"",
        d_name:"",
        state:false,
        search: '',
        pagination: {},
        selected: [],
        rows_per_page:[10,20,{"text":"แสดงทั้งหมด","value":-1}],//////////////////////////   teach me pleas!
        headers: [
          { text: 'การทำงาน', value: 'การทำงาน',align: 'center',sortable: false,  },
          { text: 'วันที่ทำงาน', value: 'วันที่ทำงาน',align: 'left',sortable: false,  },
          { text: 'รหัสนักเรียน/นักศึกษา', value: 'รหัสนักเรียน/นักศึกษา',align: 'left',sortable: false,  },
          { text: 'เพศ', value: 'เพศ',align: 'left',sortable: false,  },
          { text: 'ชื่อนักเรียน/นักศึกษา', value: 'ชื่อนักเรียน/นักศึกษา',align: 'left',sortable: false,  },
          { text: 'รหัสประจำตัวประชาชน', value: 'รหัสประจำตัวประชาชน',align: 'left',sortable: false,  },
          { text: 'วัน เดือน ปีเกิด', value: 'วัน เดือน ปีเกิด',align: 'left',sortable: false,  },
          { text: 'หมู่เลือด', value: 'หมู่เลือด',align: 'left',sortable: false,  },
          { text: 'username', value: 'username',align: 'left',sortable: false,  },
          { text: 'password', value: 'password',align: 'left',sortable: false,  },
          { text: 'กลุ่มการเรียน', value: 'กลุ่มการเรียน',align: 'left',sortable: false,  },
          { text: 'แผนกวิชา', value: 'แผนกวิชา',align: 'left',sortable: false,  },
          { text: 'ผู้ดำเนินการ', value: 'ผู้ดำเนินการ',align: 'left',sortable: false,  },
          { text: 'เรียกคืนข้อมูล', value: 'เรียกคืนข้อมูล',align: 'left',sortable: false,  },
        ],
        datas: []
      }
    },
    async created(){
      this.state=true
      let res=await this.$http.post('/log_list/log_student_show/',{std_id:this.$route.query.std_id})
      // console.log("ola")
      //  console.log(res.data.datas)
      this.datas=res.data.datas
      this.g_name=this.datas[0].g_name
      this.d_name=this.datas[0].d_name
      this.std_prename=res.data.datas[0].std_prename
      this.std_name=res.data.datas[0].std_name
      this.std_lname=res.data.datas[0].std_lname
      // console.log(this.datas[0].g_name)
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
        this.$router.push({path: '../manage/student/show_log_student?std_id='+std_id})
      },
      async restore(id){
            let res=await this.$http.post("/student/restore",{
              id:id,
              data:"pk_student_log",
              target:"pk_student",
              u_id:sessionStorage.getItem("username")
            })
              if(res.data.ok==true){//this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt
                this.$router.push({name: 'manage-student'})
              }
              else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}  
      }
    }
  }
</script>