 goto MAIN

length(x,y,z)
 q ((x*x)+(y*y)+(z*z))**0.5

sdf(px,py,pz)
 q $$length(px,py,pz)-3

light(px,py,pz)
 s lx=1 s ly=1 s lz=-1 s lr=$$length(lx,ly,lz)
 s lx=lx/lr s ly=ly/lr s lz=lz/lr s r=$$length(px,py,pz)
 s nx=px/r s ny=py/r s nz=pz/r s c=(lx*nx)+(ly*ny)+(lz*nz)
 if c<0 s c=0
 q c

trace(vx,vy,vz)
 s ret=0.1 s px=0 s py=0 s pz=-5
 for i=1:1:100 do
 .if $$length(px,py,pz)<1000000 do
 ..s s=$$sdf(px,py,pz)
 ..s px=px+(vx*s) s py=py+(vy*s) s pz=pz+(vz*s)
 if s<0.001 s ret=$$light(px,py,pz)
 q ret

MAIN:

 s chars="$@B%8&WM#*oahkbdpqwmZO0QLCJUYXzcvunxrjft/\|()1{}[]?-_+~<>i!lI;:,""^`'. "

 for y=100:-1:0 do
 .for x=0:1:100 do
 ..s vx=(x-50)/50 s vy=(y-50)/50 s vz=1
 ..s len=$$length(vx,vy,vz)
 ..s vx=vx/len s vy=vy/len s vz=vz/len
 ..s c=$$trace(vx,vy,vz)
 ..w $EXTRACT(chars,70-(c*69\1)),$EXTRACT(chars,70-(c*69\1))
 .w "",!
