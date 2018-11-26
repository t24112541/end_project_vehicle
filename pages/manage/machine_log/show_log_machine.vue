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
    <div class="cv_header ">ข้อมูลรถ ทะเบียน {{mc_code}} ของ {{std_id}}</div>

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
        
        <td class="text-xs-center xs10">{{ props.item.mc_log_work }}</td>
        <td class="text-xs-center xs10">{{ props.item.mc_log_date }}</td>
        <td class="text-xs-left xs10">{{ props.item.mc_code }}</td>
        <td class="text-xs-left">{{ props.item.mc_brand }}</td>
        <td class="text-xs-left">{{ props.item.mc_series }}</td>
        <td class="text-xs-left">{{ props.item.std_id }}</td>
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
        std_id:"",
        mc_code:"",
        state:false,
        search: '',
        pagination: {},
        selected: [],
        rows_per_page:[10,20,{"text":"แสดงทั้งหมด","value":-1}],//////////////////////////   teach me pleas!
        headers: [
          { text: 'การทำงาน', value: 'การทำงาน',align: 'center',sortable: false,  },
          { text: 'วันที่ทำงาน', value: 'วันที่ทำงาน',align: 'center',sortable: false,  },
          { text: 'ทะเบียนรถ',align: 'left',sortable: false, value: 'ทะเบียนรถ'},
          { text: 'แบรนด์รถ', value: 'แบรนด์รถ',align: 'left', sortable: false,},
          { text: 'รุ่นรถ', value: 'รุ่นรถ',align: 'left',sortable: false,  },
          { text: 'ผู้ดำเนินการ', value: 'ผู้ดำเนินการ',align: 'left',sortable: false,  },
          { text: 'เรียกคืนข้อมูล', value: 'เรียกคืนข้อมูล',align: 'left',sortable: false,  },
        ],
        datas: []
      }
    },
    async created(){
      this.state=true
      let res=await this.$http.post('/log_list/log_machine_show/',{mc_id:this.$route.query.mc_id})
      // console.log("ola")
      //  console.log(res.data.datas)
      this.datas=res.data.datas
      this.std_id=res.data.datas[0].std_prename
      this.mc_code=res.data.datas[0].std_name
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
      log_machine_show(mc_id){
        this.$router.push({path: '../manage/machine/show_log_machine?mc_id='+mc_id})
      },
      async restore(id){
            let res=await this.$http.post("/machine/restore",{
              id:id,
              data:"pk_machine_log",
              target:"pk_machine",
              u_id:sessionStorage.getItem("username")
            })
              if(res.data.ok==true){//this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt
                this.$router.push({name: 'manage-machines'})
              }
              else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}  
      }
    }
  }
</script>