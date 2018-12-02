
<script>
  export default {
    
    created(){
        sessionStorage.removeItem('username');
        sessionStorage.removeItem('password');
        sessionStorage.removeItem('status');
        sessionStorage.removeItem('id');
        this.$router.push({path: './'})
    },
  
  }
</script>