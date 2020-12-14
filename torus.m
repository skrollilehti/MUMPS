 goto MAIN

length(x,y,z)
 q ((x*x)+(y*y)+(z*z))**0.5

sdf(px,py,pz)
 s tempx=px s tempy=py s tempz=pz
 s px=tempx s py=tempz s pz=tempy
 s tx=2.8 s ty=1.3
 s QX=((px*px)+(pz*pz))**0.5-tx
 s QY=py
 q ((QX*QX)+(QY*QY))**0.5-ty

light(px,py,pz)
 s lx=5-px s ly=2-py s lz=-20-pz s lr=$$length(lx,ly,lz)
 s eps=0.01
 s nx=($$sdf(px+eps,py,pz)-$$sdf(px-eps,py,pz))
 s ny=($$sdf(px,py+eps,pz)-$$sdf(px,py-eps,pz))
 s nx=($$sdf(px,py,pz+eps)-$$sdf(px,py,pz-eps))

 s lx=lx/lr s ly=ly/lr s lz=lz/lr
 s r=$$length(px,py,pz)
 s nx=px/r s ny=py/r s nz=pz/r 
 ;s nx=1/(3**0.5) if px<0 s nx=-1/(3**0.5)
 ;s ny=1/(3**0.5) if py<0 s ny=-1/(3**0.5)
 ;s nz=1/(3**0.5) if pz<0 s nz=-1/(3**0.5)
 s c=(lx*nx)+(ly*ny)+(lz*nz)
 if c<0 s c=0
 q c*1.6 ; OMG HACK LOL

trace(vx,vy,vz)
 s ret=0.1 s px=0 s py=0 s pz=-5
 for i=1:1:100 do
 .if $$length(px,py,pz)<1000000 do
 ..s s=$$sdf(px,py,pz)
 ..s px=px+(vx*s) s py=py+(vy*s) s pz=pz+(vz*s)
 if s<0.001 s ret=$$light(px,py,pz)
 q ret

MAIN:

 s chars="$@B%8&WM##oahkbdpqwmZO0QLCJUYXzcvunxrjft/\|()1{}[]?-_+~<>i!lI;:,""^`'. "

 for y=100:-1:0 do
 .for x=0:1:100 do
 ..s vx=(x-50)/50 s vy=(y-50)/50 s vz=1
 ..s len=$$length(vx,vy,vz)
 ..s vx=vx/len s vy=vy/len s vz=vz/len
 ..s c=$$trace(vx,vy,vz)
 ..w $EXTRACT(chars,70-(c*69\1)),$EXTRACT(chars,70-(c*69\1))
 .w "",!

