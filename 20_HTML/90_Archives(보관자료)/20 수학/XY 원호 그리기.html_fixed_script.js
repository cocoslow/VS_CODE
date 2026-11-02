<script>
/* ── 격자 ── */
(function(){
  const g=document.getElementById('grid');
  if(!g) return;
  for(let i=0;i<=400;i+=20){
    const lh=document.createElementNS('http://www.w3.org/2000/svg','line');
    lh.setAttribute('x1',-20);lh.setAttribute('x2',420);lh.setAttribute('y1',i);lh.setAttribute('y2',i);g.appendChild(lh);
    const lv=document.createElementNS('http://www.w3.org/2000/svg','line');
    lv.setAttribute('y1',-20);lv.setAttribute('y2',420);lv.setAttribute('x1',i);lv.setAttribute('x2',i);g.appendChild(lv);
  }
  // 12개 포인트 & 라벨 미리 생성
  const pg=document.getElementById('ptGroup'), lg=document.getElementById('lblGroup');
  const cols=['#3B82F6','#F59E0B','#10B981'];
  for(let c=0;c<4;c++){
    for(let p=0;p<3;p++){
      const circ=document.createElementNS('http://www.w3.org/2000/svg','circle');
      circ.id=`pt-${c}-${p}`; circ.setAttribute('r',3); circ.setAttribute('fill',cols[p]); pg.appendChild(circ);
      const txt=document.createElementNS('http://www.w3.org/2000/svg','text');
      txt.id=`lbl-${c}-${p}`; txt.setAttribute('font-size','7.5'); txt.setAttribute('fill',cols[p]);
      txt.setAttribute('font-family','JetBrains Mono,monospace'); txt.setAttribute('stroke','#0E1117');
      txt.setAttribute('stroke-width','2'); txt.setAttribute('paint-order','stroke'); lg.appendChild(txt);
    }
  }
})();

/* ── 헬퍼 ── */
const el = id => document.getElementById(id);
function sv(id,v){ el(id).value=v; update(); }
function adjVal(id, d) {
  const e = el(id);
  const v = parseFloat(e.value) + d;
  e.value = Math.max(e.min, Math.min(e.max, v));
  update();
}

/* ── 기본값 ── */
let curC = 0; // 0:LT, 1:RT, 2:RB, 3:LB
function setC(n){
  curC=n;
  [0,1,2,3].forEach(i=>el('btn-c'+i)?.classList.toggle('on',i===n));
  update();
}

const DEFAULTS = { 'sl-tilt': 5, 'sl-r': 30, 'sl-ox': 0, 'sl-oy': 0, 'sl-ys1': 20, 'sl-ys2': 120 };
function resetAll(){
  Object.entries(DEFAULTS).forEach(([id,v])=>el(id).value=v);
  setC(0);
}

const SC = 1.6;
const MX = 70, MY = 30;
const PROD_W = 200, PROD_H = 200;

/* ── 메인 업데이트 ── */
function update(){
  const tilt = parseFloat(el('sl-tilt').value);
  const R_mm = parseFloat(el('sl-r').value);
  const ox_mm= parseFloat(el('sl-ox').value);
  const oy_mm= parseFloat(el('sl-oy').value);
  const ys1  = parseFloat(el('sl-ys1').value);
  const ys2  = parseFloat(el('sl-ys2').value);

  // 상단 슬라이더 값
  el('v-tilt').textContent = (tilt>=0?'+':'')+tilt.toFixed(1)+'°';
  el('v-r').textContent    = R_mm+'mm';
  el('v-ox').textContent   = (ox_mm>=0?'+':'')+ox_mm+'mm';
  el('v-oy').textContent   = (oy_mm>=0?'+':'')+oy_mm+'mm';
  el('v-ys1').textContent  = ys1+'mm';
  el('v-ys2').textContent  = ys2+'mm';

  const rad = tilt * Math.PI / 180;
  const cosT = Math.cos(rad), sinT = Math.sin(rad);
  const PX = MX + ox_mm * SC, PY = MY + oy_mm * SC;

  // 제품 그룹 회전
  el('prodGroup').setAttribute('transform',`translate(${ox_mm*SC},${oy_mm*SC}) rotate(${tilt} ${MX} ${MY})`);
  el('prodRect').setAttribute('x', MX); el('prodRect').setAttribute('y', MY);

  // 마스터 이미지
  el('masterFill').setAttribute('x',MX); el('masterFill').setAttribute('y',MY);
  el('masterRect').setAttribute('x',MX); el('masterRect').setAttribute('y',MY);
  const R_svgpx = R_mm * SC;
  const W_px = PROD_W * SC, H_px = PROD_H * SC;
  function setMArc(id, cx, cy, sx, sy, ex, ey){
    el(id).setAttribute('d',`M ${cx+sx} ${cy+sy} A ${R_svgpx} ${R_svgpx} 0 0 1 ${cx+ex} ${cy+ey}`);
  }
  setMArc('masterArc0', MX+R_svgpx, MY+R_svgpx, -R_svgpx, 0, 0, -R_svgpx);
  setMArc('masterArc1', MX+W_px-R_svgpx, MY+R_svgpx, 0, -R_svgpx, R_svgpx, 0);
  setMArc('masterArc2', MX+W_px-R_svgpx, MY+H_px-R_svgpx, R_svgpx, 0, 0, R_svgpx);
  setMArc('masterArc3', MX+R_svgpx, MY+H_px-R_svgpx, 0, R_svgpx, -R_svgpx, 0);

  // 센서 계산
  const botSvg = { x: PX - sinT * PROD_H * SC, y: PY + cosT * PROD_H * SC };
  function edgeXatSvgY(svgY) {
    const t = (svgY - PY) / (botSvg.y - PY);
    return PX + t*(botSvg.x - PX);
  }
  const s1y_px = MY + ys1 * SC, s2y_px = MY + ys2 * SC;
  const x1_px = edgeXatSvgY(s1y_px), x2_px = edgeXatSvgY(s2y_px);
  const x1_mm = (x1_px - MX) / SC, x2_mm = (x2_px - MX) / SC;
  const dx_mm = x2_mm - x1_mm, dy_mm = ys2 - ys1;
  const theta_calc = Math.atan2(dx_mm, dy_mm) * 180 / Math.PI;

  el('s1line').setAttribute('y1',s1y_px); el('s1line').setAttribute('y2',s1y_px);
  el('s2line').setAttribute('y1',s2y_px); el('s2line').setAttribute('y2',s2y_px);
  el('ps1').setAttribute('cx',x1_px); el('ps1').setAttribute('cy',s1y_px);
  el('ps2').setAttribute('cx',x2_px); el('ps2').setAttribute('cy',s2y_px);
  el('ls1').setAttribute('x',x1_px+8); el('ls1').setAttribute('y',s1y_px-5);
  el('ls1').textContent = `(${x1_mm.toFixed(2)}, ${ys1})`;
  el('ls2').setAttribute('x',x2_px+8); el('ls2').setAttribute('y',s2y_px-5);
  el('ls2').textContent = `(${x2_mm.toFixed(2)}, ${ys2})`;

  // dx 브라켓
  const dxY = Math.max(s1y_px, s2y_px) + 18;
  el('dxLine').setAttribute('x1',Math.min(x1_px,x2_px)); el('dxLine').setAttribute('y1',dxY);
  el('dxLine').setAttribute('x2',Math.max(x1_px,x2_px)); el('dxLine').setAttribute('y2',dxY);
  el('dxTick1').setAttribute('x1',Math.min(x1_px,x2_px)); el('dxTick1').setAttribute('x2',Math.min(x1_px,x2_px));
  el('dxTick1').setAttribute('y1',dxY-4); el('dxTick1').setAttribute('y2',dxY+4);
  el('dxTick2').setAttribute('x1',Math.max(x1_px,x2_px)); el('dxTick2').setAttribute('x2',Math.max(x1_px,x2_px));
  el('dxTick2').setAttribute('y1',dxY-4); el('dxTick2').setAttribute('y2',dxY+4);
  el('dxTxt').setAttribute('x',(x1_px+x2_px)/2); el('dxTxt').setAttribute('y',dxY+12);
  el('dxTxt').textContent = `dx: ${dx_mm.toFixed(3)}`;

  el('v-x1').textContent = x1_mm.toFixed(3)+' mm';
  el('v-x2').textContent = x2_mm.toFixed(3)+' mm';
  el('v-dx').textContent = (dx_mm>=0?'+':'')+dx_mm.toFixed(3)+' mm';
  el('v-dy').textContent = dy_mm.toFixed(1)+' mm';
  el('v-ang').textContent = (theta_calc>=0?'+':'')+theta_calc.toFixed(2)+'°';

  // 변환 함수
  function locToSvg(lx, ly) {
    const px = lx*SC, py = ly*SC;
    return { x: PX + cosT*px - sinT*py, y: PY + sinT*px + cosT*py };
  }
  function locToMach(lx, ly) {
    return { x: +(cosT*lx - sinT*ly + ox_mm).toFixed(3), y: +(sinT*lx + cosT*ly + oy_mm).toFixed(3) };
  }

  const k = 1 - 1/Math.SQRT2;
  const names = ['시작','중간','끝'];
  let sel_S_m, sel_M_m, sel_E_m, sel_C_m, sel_S_svg, sel_M_svg, sel_E_svg, sel_C_svg;

  for(let i=0; i<4; i++){
    let sc, mc, ec, cc;
    if(i===0){ cc={x:R_mm, y:R_mm}; sc={x:0, y:R_mm}; ec={x:R_mm, y:0}; mc={x:R_mm*k, y:R_mm*k}; }
    else if(i===1){ cc={x:PROD_W-R_mm, y:R_mm}; sc={x:PROD_W-R_mm, y:0}; ec={x:PROD_W, y:R_mm}; mc={x:PROD_W-R_mm*k, y:R_mm*k}; }
    else if(i===2){ cc={x:PROD_W-R_mm, y:PROD_H-R_mm}; sc={x:PROD_W, y:PROD_H-R_mm}; ec={x:PROD_W-R_mm, y:PROD_H}; mc={x:PROD_W-R_mm*k, y:PROD_H-R_mm*k}; }
    else { cc={x:R_mm, y:PROD_H-R_mm}; sc={x:R_mm, y:PROD_H}; ec={x:0, y:PROD_H-R_mm}; mc={x:R_mm*k, y:PROD_H-R_mm*k}; }

    const svgS = locToSvg(sc.x, sc.y), svgM = locToSvg(mc.x, mc.y), svgE = locToSvg(ec.x, ec.y), svgC = locToSvg(cc.x, cc.y);
    const mS = locToMach(sc.x, sc.y), mM = locToMach(mc.x, mc.y), mE = locToMach(ec.x, ec.y), mC = locToMach(cc.x, cc.y);

    if(i === curC){
      sel_S_m=mS; sel_M_m=mM; sel_E_m=mE; sel_C_m=mC;
      sel_S_svg=svgS; sel_M_svg=svgM; sel_E_svg=svgE; sel_C_svg=svgC;
    }

    el('arcCorr'+i).setAttribute('d', `M ${svgS.x.toFixed(1)} ${svgS.y.toFixed(1)} A ${R_svgpx.toFixed(1)} ${R_svgpx.toFixed(1)} ${tilt} 0 1 ${svgE.x.toFixed(1)} ${svgE.y.toFixed(1)}`);
    el('arcCorr'+i).setAttribute('opacity', i===curC ? 1 : 0.3);
    el('arcCorr'+i).setAttribute('stroke-width', i===curC ? 2.5 : 1.2);

    const pts = [svgS, svgM, svgE], mpts = [mS, mM, mE];
    const offs = [[[8,-2], [8,-6], [5,-10]], [[-5,-10], [-10,-10], [-12,0]], [[-10,0], [-10,10], [-5,15]], [[5,15], [10,10], [8,0]]];
    for(let p=0; p<3; p++){
      const pel = el(`pt-${i}-${p}`), lel = el(`lbl-${i}-${p}`);
      pel.setAttribute('cx', pts[p].x); pel.setAttribute('cy', pts[p].y);
      lel.setAttribute('x', pts[p].x + offs[i][p][0]); lel.setAttribute('y', pts[p].y + offs[i][p][1]);
      lel.textContent = `${names[p]} (${mpts[p].x}, ${mpts[p].y})`;
      lel.setAttribute('opacity', i===curC ? 1 : 0.3);
      lel.setAttribute('font-size', i===curC ? '7.5' : '6.5');
    }
    el(`r${i}-s`).textContent = `(${mS.x}, ${mS.y})`;
    el(`r${i}-m`).textContent = `(${mM.x}, ${mM.y})`;
    el(`r${i}-e`).textContent = `(${mE.x}, ${mE.y})`;
    el(`res${i}`).style.opacity = i===curC ? 1 : 0.5;
    el(`res${i}`).style.background = i===curC ? 'rgba(59,130,246,0.1)' : 'transparent';
  }

  // 선택 코너 보조선
  let s_loc_master;
  if(curC===0) s_loc_master={x:0, y:R_mm}; else if(curC===1) s_loc_master={x:PROD_W-R_mm, y:0};
  else if(curC===2) s_loc_master={x:PROD_W, y:PROD_H-R_mm}; else s_loc_master={x:R_mm, y:PROD_H};
  const mS_p = {x: MX + s_loc_master.x*SC, y: MY + s_loc_master.y*SC};
  el('diffLineS').setAttribute('x1', mS_p.x); el('diffLineS').setAttribute('y1', mS_p.y);
  el('diffLineS').setAttribute('x2', sel_S_svg.x); el('diffLineS').setAttribute('y2', sel_S_svg.y);

  el('rc1').setAttribute('x1', sel_C_svg.x); el('rc1').setAttribute('y1', sel_C_svg.y);
  el('rc1').setAttribute('x2', sel_S_svg.x); el('rc1').setAttribute('y2', sel_S_svg.y);
  el('rc2').setAttribute('x1', sel_C_svg.x); el('rc2').setAttribute('y1', sel_C_svg.y);
  el('rc2').setAttribute('x2', sel_M_svg.x); el('rc2').setAttribute('y2', sel_M_svg.y);
  el('rc3').setAttribute('x1', sel_C_svg.x); el('rc3').setAttribute('y1', sel_C_svg.y);
  el('rc3').setAttribute('x2', sel_E_svg.x); el('rc3').setAttribute('y2', sel_E_svg.y);

  // 각도 호
  const aR=32;
  el('angArc').setAttribute('d',`M ${PX+aR} ${PY} A ${aR} ${aR} 0 0 1 ${PX+aR*cosT} ${PY+aR*sinT}`);
  el('angTxt').setAttribute('x',PX+aR*Math.cos(rad/2)+3);
  el('angTxt').setAttribute('y',PY+aR*Math.sin(rad/2)+3);
  el('angTxt').textContent=theta_calc.toFixed(1)+'°';

  // 하단 바
  el('b-tilt').textContent=(tilt>=0?'+':'')+tilt.toFixed(1)+'°';
  el('b-r').textContent=R_mm+'mm';
  el('b-off').textContent=`${ox_mm>=0?'+':''}${ox_mm}, ${oy_mm>=0?'+':''}${oy_mm}`;
  el('b-start').textContent=`${sel_S_m.x},${sel_S_m.y}`;
  el('b-mid').textContent=`${sel_M_m.x},${sel_M_m.y}`;
  el('b-end').textContent=`${sel_E_m.x},${sel_E_m.y}`;
  el('b-cen').textContent=`${sel_C_m.x},${sel_C_m.y}`;

  // ST 코드
  el('stCode').innerHTML=
`<span class="cmt">// ① 각도 보정</span>
<span class="vr">dx</span>   := <span class="nm">${dx_mm.toFixed(3)}</span>; <span class="vr">dy</span> := <span class="nm">${dy_mm.toFixed(1)}</span>;
<span class="vr">rRad</span> := <span class="fn">ATAN</span>(<span class="vr">dx</span>/<span class="vr">dy</span>);
<span class="cmt">// θ = <span class="hi">${theta_calc.toFixed(3)}°</span></span>

<span class="cmt">// ② 선택 코너 (${['LT','RT','RB','LB'][curC]}) 머신 좌표</span>
<span class="cmt">// 시작: (${sel_S_m.x}, ${sel_S_m.y})</span>
<span class="cmt">// 중간: (${sel_M_m.x}, ${sel_M_m.y})</span>
<span class="cmt">// 끝:   (${sel_E_m.x}, ${sel_E_m.y})</span>`;
}

/* ── 제품 드래그 ── */
let drag=false, dragSX=0, dragSY=0, dragOx=0, dragOy=0;
const svg=el('mainSvg'), prodG=el('prodGroup');
function toSvgPt(evt) {
  const rect=svg.getBoundingClientRect();
  const vw=440, vh=420;
  const cx=evt.touches?evt.touches[0].clientX:evt.clientX;
  const cy=evt.touches?evt.touches[0].clientY:evt.clientY;
  return {x:(cx-rect.left)/rect.width*vw-20, y:(cy-rect.top)/rect.height*vh-20};
}
prodG.addEventListener('mousedown', e=>{
  drag=true; const pt=toSvgPt(e); dragSX=pt.x; dragSY=pt.y;
  dragOx=parseFloat(el('sl-ox').value); dragOy=parseFloat(el('sl-oy').value);
  prodG.style.cursor='grabbing'; e.preventDefault();
});
prodG.addEventListener('touchstart', e=>{
  drag=true; const pt=toSvgPt(e); dragSX=pt.x; dragSY=pt.y;
  dragOx=parseFloat(el('sl-ox').value); dragOy=parseFloat(el('sl-oy').value);
  e.preventDefault();
},{passive:false});
window.addEventListener('mousemove', e=>{
  if(!drag)return;
  const pt=toSvgPt(e); const SC=1.6;
  el('sl-ox').value=Math.max(-60,Math.min(60,dragOx+(pt.x-dragSX)/SC));
  el('sl-oy').value=Math.max(-60,Math.min(60,dragOy+(pt.y-dragSY)/SC));
  update();
});
window.addEventListener('touchmove', e=>{
  if(!drag)return; e.preventDefault();
  const pt=toSvgPt(e); const SC=1.6;
  el('sl-ox').value=Math.max(-60,Math.min(60,dragOx+(pt.x-dragSX)/SC));
  el('sl-oy').value=Math.max(-60,Math.min(60,dragOy+(pt.y-dragSY)/SC));
  update();
},{passive:false});
window.addEventListener('mouseup', ()=>{drag=false;prodG.style.cursor='move';});
window.addEventListener('touchend', ()=>{drag=false;});

/* ── 이벤트 ── */
['sl-tilt','sl-r','sl-ox','sl-oy','sl-ys1','sl-ys2'].forEach(id=>el(id).addEventListener('input', update));
update();
</script>
