
<template>
    <v-card  @keypress.enter="missing_update(ms_id)">
      <v-alert
        v-model="danger"
        dismissible
        :type=type_api
      >
        {{alt_txt}}
      </v-alert>
        <v-card-title
          class="grey lighten-4 py-4 title"
        >
        <v-flex xs7 >
          ข้อมูลการแจ้งหาย
        </v-flex>
        
        </v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>
            <v-flex xs12>
            <v-stepper v-model="ms_step">
              <v-stepper-header>
                <v-stepper-step :complete="ms_step > 1" step="1">ขั้นที่ 1 รอรับเรื่อง</v-stepper-step>
          
                <v-divider></v-divider>
          
                <v-stepper-step :complete="ms_step > 2" step="2">ขั้นที่ 2 รับเรื่องแล้ว</v-stepper-step>
          
                <v-divider></v-divider>
          
                <v-stepper-step :complete="ms_step >= 3" step="3">ขั้นที่ 3 พบแล้ว</v-stepper-step>
              </v-stepper-header>
          
              <v-stepper-items>
                <!-- <v-stepper-content step="1">
                 <v-card
                    class="mb-5"
                    color="grey lighten-1"
                    height="200px"
                  ></v-card> -->
                  
                  <!-- <v-btn
                    color="primary"
                    @click="ms_step = 2"
                    style="width:100%"
                  >
                    <i class="fas fa-check-circle fa-2x"></i>&nbsp;
                    <v-spacer></v-spacer> รับเรื่อง<v-spacer></v-spacer>
                  </v-btn> -->
                  
                <!-- </v-stepper-content> --> 
          
                <!-- <v-stepper-content step="2"> -->
                  <!-- <v-card
                    class="mb-5"
                    color="grey lighten-1"
                    height="200px"
                  ></v-card> -->
          
                  <!-- <v-btn
                    color="primary"
                    @click="ms_step = 3"
                    style="width:100%"
                  >
                    <i class="fas fa-search fa-2x"></i>&nbsp;
                    <v-spacer></v-spacer> พบแล้ว<v-spacer></v-spacer>
                  </v-btn> -->
                <!-- </v-stepper-content> -->
          
                <v-stepper-content step="3">        
                 <v-flex text-xs-center xs12 style="color:#81c784"><i class="fas fa-check-circle fa-2x" ></i></v-flex>
                 <v-flex text-xs-center xs12 style="color:#81c784">พบแล้ว</v-flex>
                </v-stepper-content>
              </v-stepper-items>
            </v-stepper>
            </v-flex>
            <v-flex xs12 >
              <v-btn  color="#55b159" style="font-size:110%;width:95%;color:#fff" @click="ms_link_mis_btn(u_id)">
                 {{ms_type}} {{ms_name}}
              </v-btn>
            </v-flex>
            <v-flex xs12>
       
            </v-flex>
            <v-flex xs12>
                <v-timeline
                align-top
                dense
              >
                <v-timeline-item
                  color=" teal lighten-3"
                  icon="fas fa-check"
                >
                  <v-layout pt-3>
                    <v-flex xs5>
                      <strong>{{ms_status}}</strong>
                    </v-flex>
                    <v-flex>
                      <div class="caption">{{u_ms_date}}</div>
                    </v-flex>
                  </v-layout>
                </v-timeline-item>
        

                <v-timeline-item
                  color="pink"
                  icon="fas fa-exclamation"
                >
                  <v-layout pt-3>
                    <v-flex xs5>
                      <strong>วันที่แจ้งหาย</strong>
                    </v-flex>
                    <v-flex>
                      <!-- <strong>{{ms_date}}</strong> -->
                      <div class="caption">{{ms_date}}</div>
                    </v-flex>
                  </v-layout>
                </v-timeline-item>
              </v-timeline>

            </v-flex>
           
          </v-layout>
        </v-container>
        <v-card-actions>
          <v-btn flat color="red lighten-2" @click="missing()"><i class="fas fa-arrow-circle-left fa-2x"></i></v-btn>
          <v-spacer></v-spacer>
          <!-- <v-btn flat color="green lighten-2"  @click="missing_update()"><i class="fas fa-save fa-2x"></i></v-btn> -->
        </v-card-actions>
    </v-card>
</template>

<script>
    export default {
        layout: 'teacher',
        data(){
          return{
            ms_id:"",
            ms_date:"",
            ms_status:"",
            ms_name:"",
            u_ms_date:"",
            ms_type:"",
            ms_step:"1",
            u_id:"",
            ms_table:"",
            
            ms_link_mis:"",
            ms_link_u_mis:"",

            type_api:"",
            danger:false,
            conf_del:false,
            isEditing:null,
            rules: {
                  required: value => !!value || 'ห้ามว่าง.',
                  // counter: value => value.length <= 10 || 'เต็ม 10 ตัวอักษร',
            },
          }
        },
        async created(){
          this.sh_missing()
        },
        watch:{
          ms_step(newValue){
            if(newValue=="1"){this.ms_status="ขั้นที่ 1 รอรับเรื่อง"}
            else if(newValue=="2"){this.ms_status="ขั้นที่ 2 รับเรื่องแล้ว"}
            else if(newValue=="3"){this.ms_status="ขั้นที่ 3 พบเเล้ว"}
            console.log(this.ms_status)
          },
          ms_status(newValue){
            if(newValue=="ขั้นที่ 1 รอรับเรื่อง"){this.ms_step="1"}
            else if(newValue=="ขั้นที่ 2 รับเรื่องแล้ว"){this.ms_step="2"}
            else if(newValue=="ขั้นที่ 3 พบเเล้ว"){this.ms_step="3"}
            console.log(this.ms_step)
          },
          ms_table(newValue){
            if(newValue=="pk_machine"){this.ms_link_mis="../machines/edit_machine?ms=true&&mc_id="}
            else if(newValue=="pk_accessories"){this.ms_link_mis="../accessories/edit_accessories?ms=true&&ac_id="}
            console.log(this.ms_step)
          }
        },
        methods:{
          ms_link_mis_btn(u_id){
            console.log("ms_link_mis_btn")
            this.$router.push({path:this.ms_link_mis+u_id}) 
          },
          step_plus(){
            console.log("step")
            if(this.ms_step!=3){this.ms_step++}
            console.log(this.ms_step)
          },
          conf_del(){this.conf_del=true},
          async missing_del(){//console.log("missing_del")
            let res=await this.$http.post('/missing/missing_del/',{
              ms_id:this.$route.query.ms_id,
              d_code:this.d_code,
              d_name:this.d_name,
              u_id:sessionStorage.getItem("username")
            })
            if(res.data.ok==true){
              this.isEditing=!this.isEditing
              this.$router.push({name:"teacher-missing"})
            }
            else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
          },
          async sh_missing(){
            let res=await this.$http.post('/missing/sh_missing/',{ms_id:this.$route.query.ms_id})
            this.ms_id=this.$route.query.ms_id
            this.ms_date=res.data.datas[0].ms_date
            this.ms_type=res.data.type
            this.ms_status=res.data.datas[0].ms_status
            this.ms_name=res.data.datas[0].ms_name
            this.u_ms_date=res.data.datas[0].u_ms_date
            this.u_id=res.data.datas[0].u_id
            this.ms_table=res.data.datas[0].ms_table
            // console.log(res.data.datas[0].ms_date)
          },
          async missing_update(ms_id){
            //console.log("ms_id"+ms_id)
            let res=await this.$http.post("/missing/missing_update",{
              ms_id:this.ms_id,
              ms_status:this.ms_status,
              u_id:sessionStorage.getItem("username")
            })
            console.log(res.data)
              if(res.data.ok==true){this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt
                this.isEditing=!this.isEditing
                this.$router.push({name: 'teacher-missing'})
              }
             else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
          },
          missing(){
            this.$router.push({name: 'teacher-missing'})
          }
        }
    }
</script>