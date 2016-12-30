# NASA-APOD-Sinatra-Project
I wanted to make something using Sinatra and also use a NASA API. This is the result.

<!-- <%else%>
  <iframe width="420" height="315"
  src="<%=location.url%>"> -->


  <%if !location.url.include?("youtube")%>
    <img src="<%=location.url%>" style="width:15em" alt="<%=location.title%> >

  <%end%>

  <%if location.url.include?("youtube")%>
    <iframe width="420" height="315"
    src="<%=location.url%>">
  <%else%>
    <img src="<%=location.url%>" alt="<%=location.title%>" >
  <%end%>
