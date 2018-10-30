
<script>
  export default {
    
    created(){
        sessionStorage.removeItem('username');
        sessionStorage.removeItem('password');
        sessionStorage.removeItem('status');
        this.$router.push({path: './'})
    },
  
  }
</script>