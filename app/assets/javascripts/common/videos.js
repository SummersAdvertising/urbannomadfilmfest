
  function getVideoInfo(link) {
  
  	var provider = getVideoProvider(link);
  
	var code, sourceLink;
	
	switch ( provider ) {
	  case "youtube":
	  	code = getYoutubeCode( $("#newVideoContent").val());	     
	  break;
	  
	  case "vimeo":
	  	code = getVimeoCode( $("#newVideoContent").val());
	  break;
	}
	sourceLink = getVideoSourceLink(provider);
	
	return { "provider": provider, "code": code, "sourceLink": sourceLink };
	  
  }
  
  function getVideoSourceLink(provider) {
	  
	switch ( provider ) {
	  case "youtube":
	    return "http://www.youtube.com/embed/";
	  break;
	  
	  case "vimeo":
	    return "http://player.vimeo.com/video/";	          	 
	  break;
	}
  }

  function getVideoProvider(link) {
	  
	  var providerList = ["youtube", "vimeo"];
	  
	  
	  for( var p in providerList ) {
	  
	  	  var re = new RegExp("/.*" + providerList[p] + ".*/", "g");
	  
		  if ( re.test(link) ) {
			  return providerList[p];
		  }
	  }
	  
	  return false;
	  
  }

  function getYoutubeCode( link ) {
    if ( link != undefined ) {
      return /[a-zA-Z0-9\?\.\:\/&=]+v=([a-zA-Z0-9_\-]+)&?.*/.exec(link)[1];
    }
    return '';
  }
  
  function getVimeoCode( link ) {	  
    if ( link != undefined ) {
      return /[a-zA-Z0-9\?\.\:]+\/([a-zA-Z0-9_\-]+)&?.*/.exec(link)[1];
    }
    return '';
  }

