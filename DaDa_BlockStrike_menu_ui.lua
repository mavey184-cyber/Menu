-- DaDa / Luau
-- Gameplay logic extracted from the user-supplied message-18.txt (Shitaro).
-- DaDa / Luau
-- Full original gameplay/runtime source with the reworked standalone interface.
-- No external Lua loader or downloaded UI library.
-- Game: Bloxstrike. Requires the same Roblox game internals / executor APIs as the supplied source.
-- All switches start OFF. Auto Shoot requires Silent Aim. Menu: Aim / Weapon / Visual / Effects / Camera tabs.

local m = {
    [59] = table.pack,
    rH = function(self, dest, offset, ...)
        local h = table.pack(...)
        table.move(h, 1, h.n, offset + 1, dest)
    end,
    qH = function(self, dest, offset, pack)
        for h = 1, pack.n, 1 do
            dest[offset + h] = pack[h]
        end
        dest.n = offset + pack.n
    end
};

local D={cache={}};
D.load=function(j)if not(D.cache[j])then
    local h,b=D.cache,{};
    b.c,h[j]=D[j](),b;
end;
return D.cache[j].c;
end;
D.a=function()local j=getgenv();
local h=rawget(j,"\0DaDa");
local b;
if type(h)~="table"then h={fields={},detours={}};
rawset(j,"\0DaDa",h);
b=h;
else
    b=h;
end;
local j=cloneref and cloneref(game:GetService("RunService"))or game:GetService("RunService");
local h=hookfunction or replaceclosure;
local K,S,o=restorefunction or restorefunc,isreadonly,setreadonly;
local function t(G)if type(o)~="function"then return false;
elseif  type(S)~="function"then return false;
end;
local i,Y=pcall(S,G);
if i then
    if not(Y)then
        return false;
    end;
else
    return false;
end;
return pcall(o,G,false);
end;
local function S(G,i)if i then
    pcall(o,G,true);
end;
end;
local function o(G,i,Y)local O,T=t(G),pcall(function()G[i]=Y;
end);
S(G,O);
return T;
end;
local S,t,G,i,Y,O={},{},{},{},{},true;
local T,x={shared=b,takeover=function()local p=b.unload;
b.unload=nil;
if type(p)=="function"then pcall(p);
end;
end,publish=function(p)b.unload=p;
end,adopt=function(p)if p then
    S[#S+1]=p;
end;
return p;
end,connect=function(p,A)local M=p:Connect(A);
S[#S+1]=M;
return M;
end,bind=function(p,A)local M="\0"..tostring(math.random(10000000,90000000));
j:BindToRenderStep(M,p,A);
t[#t+1]=M;
return M;
end,own=function(p)G[#G+1]=p;
return p;
end,spawn=function(p,...)local A=task.spawn(p,...);
i[#i+1]=A;
return A;
end,teardown=function(p)Y[#Y+1]=p;
return p;
end,field=function(p,A,M)local a,B=b.fields[p];
if a then
    B=a;
else
    a={};
    b.fields[p]=a;
    B=a;
end;
local a,N=B[A];
if a==nil then
    a=p[A];
    if a==nil then
        return nil;
    end;
    B[A]=a;
    N=a;
else
    N=a;
end;
local a=M(N);
if type(a)~="function"then return N;
end;
if not(o(p,A,a))then
    B[A]=nil;
    return N;
end;
Y[#Y+1]=function()if p[A]==a then
    o(p,A,N);
end;
B[A]=nil;
end;
return N;
end,detour=function(o,p)if type(h)~="function"then return nil;
elseif  type(o)~="function"then return nil;
end;
local A=b.detours[o];
if A then
    return A;
end;
local A,M=pcall(h,o,p);
if A then
    if type(M)~="function"then return nil;
end;
else
    return nil;
end;
b.detours[o]=M;
Y[#Y+1]=function()if type(K)~="function"then pcall(h,o,M);
elseif  not(pcall(K,o))then
    pcall(h,o,M);
end;
b.detours[o]=nil;
end;
return M;
end
},getupvalues or debug and debug.getupvalues;
local h=setupvalue or debug and debug.setupvalue;
T.upvalue=function(K,o,p)if type(x)~="function"then return false;
elseif  type(h)~="function"then return false;
end;
local A,M=pcall(x,K);
if A then
    if type(M)~="table"then return false;
end;
else
    return false;
end;
local A=M[o];
if not(pcall(h,K,o,p))then
    return false;
end;
Y[#Y+1]=function()local M,a=pcall(x,K);
if M then
    if type(a)=="table"then if a[o]==p then
        pcall(h,K,o,A);
    end;
end;
end;
end;
return true;
end;
T.alive=function()local h=O;
return h;
end;
T.release=function()if not(O)then
    return;
end;
O=false;
for h=#Y,1,-1 do
    pcall(Y[h]);
    Y[h]=nil;
end;
for h=#t,1,-1 do
    pcall(j.UnbindFromRenderStep,j,t[h]);
    t[h]=nil;
end;
for j=#S,1,-1 do
    local h=S[j];
    S[j]=nil;
    if typeof(h)=="RBXScriptConnection"then pcall(h.Disconnect,h);
elseif  type(h)=="function"then pcall(h);
elseif  type(h)=="table"then if type(h.Disconnect)=="function"then pcall(h.Disconnect,h);
end;
end;
end;
for j=#i,1,-1 do
    pcall(task.cancel,i[j]);
    i[j]=nil;
end;
for j=#G,1,-1 do
    local h=G[j];
    G[j]=nil;
    pcall(h.Destroy,h);
end;
b.unload=nil;
end;
return T;
end;

D.b=function()local j=cloneref or function(h)return h;
end;
local h,b=getgenv(),{};
b.players=game:GetService("Players");
b.run=j(game:GetService("RunService"));
b.input=j(game:GetService("UserInputService"));
b.storage=j(game:GetService("ReplicatedStorage"));
b.lighting=j(game:GetService("Lighting"));
b.workspace=j(game:GetService("Workspace"));
b.collection=j(game:GetService("CollectionService"));
b.guiservice=j(game:GetService("GuiService"));
b.http=j(game:GetService("HttpService"));
b.stats=j(game:GetService("Stats"));
b.tween=j(game:GetService("TweenService"));
b.sounds=j(game:GetService("SoundService"));
b.content=j(game:GetService("ContentProvider"));
b.assets=j(game:GetService("AssetService"));
b.debris=j(game:GetService("Debris"));
b.keyframes=j(game:GetService("KeyframeSequenceProvider"));
b.clips=j(game:GetService("AnimationClipProvider"));
b.lp=b.players.LocalPlayer;
b.hook=hookfunction or replaceclosure;
b.newc=newcclosure or function(K)return K;
end;
b.getups=getupvalues or debug and debug.getupvalues;
b.setup=setupvalue or debug and debug.setupvalue;
b.info=debug and(debug.info or debug.getinfo);
b.custom_asset=getcustomasset;
local K=getthreadidentity or getidentity;
local S=setthreadidentity or setidentity;
b.identity=(function()if type(K)~="function"then return nil;
end;
local o,t=pcall(K);
if o then
    if type(t)=="number"then return t;
end;
end;
return nil;
end)();
b.reclaim=function()if type(S)=="function"then if b.identity then
    pcall(S,b.identity);
end;
end;
end;
b.elevate=function(o,t,G,i,Y)if type(S)~="function"then return pcall(o,t,G,i,Y);
end;
local O;
if type(K)=="function"then local T,x=pcall(K);
O=if T then
    if type(x)=="number"then x
else
    O
else
    O;
else
end;
pcall(S,b.identity or 8);
task.spawn(pcall,o,t,G,i,Y);
if O then
    pcall(S,O);
end;
end;
b.plain=function(o,...)if type(S)~="function"then return pcall(o,...);
end;
local t=b.identity;
if type(K)=="function"then local G,i=pcall(K);
t=if G then
    if type(i)=="number"then i
else
    t
else
    t;
else
end;
pcall(S,2);
local K=table.pack(pcall(o,...));
if t then
    pcall(S,t);
end;
return table.unpack(K,1,K.n);
end;
b.host=(function()if type(gethui)=="function"then local K,S=pcall(gethui);
if K then
    if typeof(S)=="Instance"then return j(S);
end;
end;
end;
local K,S=pcall(game.GetService,game,"CoreGui");
if K then
    if typeof(S)=="Instance"then return j(S);
end;
end;
return b.lp:FindFirstChildOfClass("PlayerGui");
end)();
b.screen=function(j)local K=Instance.new("ScreenGui");
K.IgnoreGuiInset=true;
K.ResetOnSpawn=false;
K.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;
K.DisplayOrder=j or 0;
j=pcall(function()K.Parent=b.host;
end);
if j then
else
    local S=b.lp:FindFirstChildOfClass("PlayerGui");
    j=S~=nil and pcall(function()K.Parent=S;
end);
end;
if j then
    if not(K.Parent)then
        K:Destroy();
        return nil;
    end;
else
    K:Destroy();
    return nil;
end;
return K;
end;
b.weak=function()return setmetatable({},{__mode="k"});
end;
b.module=function(j,...)local K=j or b.storage;
for j=1,select("#",...),1 do
    K=K:FindFirstChild((select(j,...)));
    if not(K)then
        return nil;
    end;
end;
if not(K:IsA("ModuleScript"))then
    return nil;
end;
local j,S=pcall(require,K);
if j then
    return S;
end;
return nil;
end;
b.drawmask=function()local j=rawget(h,"DaDa_drawmask");
if type(j)=="table"then return j;
end;
return nil;
end;
return b;
end;

D.f=function()local j=table.create;
local h=table.clear;
local b,K=table.move,{trim=function(S,o)for t=#S,o+1,-1 do
    S[t]=nil;
end;
return S;
end,drop=function(S,o)local t=#S;
S[o]=S[t];
S[t]=nil;
end
};
K.copy_with=function(S,o,t)local G=#o;
b(o,1,G,1,S);
if t~=nil then
    G+=1;
    S[G]=t;
else
end;
return K.trim(S,G);
end;
local S={};
S.__index=S;
S.new=function(o)return setmetatable({items=j(o or 8),head=1,tail=0},S);
end;
S.count=function(j)return j.tail-j.head+1;
end;
S.push=function(j,o)local t=j.tail+1;
j.tail=t;
j.items[t]=o;
return o;
end;
S.peek=function(j)if j.head>j.tail then
    return nil;
end;
return j.items[j.head];
end;
S.shift=function(j)local o=j.head;
if o>j.tail then
    return nil;
end;
local t=j.items;
local G=t[o];
t[o]=nil;
j.head=o+1;
if j.head>j.tail then
    j.head=1;
    j.tail=0;
elseif  o>64 then
    local i=j.tail-o;
    b(t,o+1,j.tail,1);
    K.trim(t,i);
    j.head=1;
    j.tail=i;
end;
return G;
end;
S.remove=function(j,o)local t=j.items;
b(t,o+1,j.tail,o);
t[j.tail]=nil;
j.tail=j.tail-1;
if j.head>j.tail then
    j.head=1;
    j.tail=0;
end;
end;
S.reset=function(j)h(j.items);
j.head=1;
j.tail=0;
end;
K.queue=S;
local j={};
j.__index=j;
j.new=function(h,b)return setmetatable({items={},create=h,hide=b,count=0,used=0},j);
end;
j.open=function(h)h.used=0;
end;
j.next=function(h)local b=h.used+1;
h.used=b;
local S=h.items[b];
if S==nil then
    S=h.create();
    if S==nil then
        h.used=b-1;
        return nil;
    end;
    h.items[b]=S;
    if b>h.count then
        h.count=b;
    end;
else
end;
return S;
end;
j.close=function(h)local b=h.hide;
if not(b)then
    return;
end;
local S=h.items;
for o=h.used+1,h.count,1 do
    local h=S[o];
    if h~=nil then
        b(h);
    end;
end;
end;
j.purge=function(h,b)local S=h.items;
for o=h.count,1,-1 do
    local t=S[o];
    S[o]=nil;
    if t~=nil then
        if b then
            b(t);
        end;
    end;
end;
h.count=0;
h.used=0;
end;
K.pool=j;
return K;
end;

D.g=function()local j,h=D.load("b"),D.load("a");
local b=j.storage;
local K=j.workspace;
local S=j.players;
local o,t,G,i,Y,O,T,x,p,A=os.clock,{version=0},{},0,{},{},{},{},{};
local M={GetAttribute=function(a,B)return rawget(a,"folder"):GetAttribute(B);
end,GetAttributes=function(a)return rawget(a,"folder"):GetAttributes();
end,GetAttributeChangedSignal=function(a,B)return rawget(a,"folder"):GetAttributeChangedSignal(B);
end
};
local function a(B,N)return B:IsA("Model")and B:GetAttribute("Bot")==true and B:GetAttribute("CombatantId")==N;
end;
local function B(N,I,R,n)if not(N)then
    return R,n;
end;
local E=N:GetChildren();
for d=1,#E,1 do
    N=E[d];
    if a(N,I)then
        d=(N:GetAttribute("Dead")~=true and 2 or 0)+(N:IsDescendantOf(K)and 1 or 0);
        if d>n then
            n,R=d,N;
        else
        end;
    else
    end;
end;
return R,n;
end;
local function N(I)local R=rawget(I,"folder"):GetAttribute("CombatantId");
if R==nil then
    return nil;
end;
local n=rawget(I,"m");
if n then
    if n.Parent then
        if n:GetAttribute("Dead")~=true then
            if n:IsDescendantOf(K)then
                if a(n,R)then
                    return n;
                end;
            end;
        end;
    end;
end;
local a=o();
if a<(rawget(I,"next")or 0)then
    return n and n.Parent and n or nil;
end;
rawset(I,"next",a+0.1);
a,n=B(K:FindFirstChild("Characters"),R,nil,-1);
a=if n<3 then
    B(b:FindFirstChild("_PVS_CulledCharacters"),R,a,n)
else
    a;
    rawset(I,"m",a);
    return a;
end;
local K={__index=function(o,a)local B=M[a];
if B then
    return B;
end;
B=rawget(o,"folder");
if a=="Character"then return N(o);
elseif  a=="Parent"then return B.Parent~=nil and S or nil;
elseif  a=="Name"or a=="DisplayName"then local S=B:GetAttribute("DisplayName");
return type(S)=="string"and S or B.Name;
elseif  a=="UserId"then local S=B:GetAttribute("UserId");
return tonumber(S)or S;
elseif  a=="avatar"then return B:GetAttribute("AvatarUserId");
end;
return nil;
end,__tostring=function(S)return"npc:"..tostring(rawget(S,"folder").Name);
end
};
local function S()i=0;
table.clear(O);
table.clear(T);
for o,M in Y,nil,nil do
    i+=1;
    G[i]=M;
    local a=o:GetAttribute("ActorId");
    if a~=nil then
        O[a]=M;
    end;
    a=o:GetAttribute("UserId");
    if a~=nil then
        T[a]=M;
        o=tonumber(a);
        if o then
            T[o]=M;
        end;
    end;
end;
local o,M=#G,i;
for a=o,M+1,-1 do
    G[a]=nil;
end;
t.version=t.version+1;
end;
local function o(M)if M:IsA("Folder")then
    if Y[M]then
        return;
    end;
else
    return;
end;
local a=setmetatable({folder=M},K);
Y[M]=a;
S();
h.connect(M:GetAttributeChangedSignal("ActorId"),S);
for M=1,#x,1 do
    pcall(x[M],a);
end;
end;
local function M(a)local B=Y[a];
if not(B)then
    return;
end;
Y[a]=nil;
S();
for S=1,#p,1 do
    pcall(p[S],B);
end;
end;
local function S(a)if A==a then
    return;
end;
A=a;
h.connect(a.ChildAdded,o);
h.connect(a.ChildRemoved,M);
local A=a:GetChildren();
for M=1,#A,1 do
    o(A[M]);
end;
end;
t.list=function()local o=i;
return G,o;
end;
t.is=function(o)return type(o)=="table"and getmetatable(o)==K;
end;
t.actor=function(K)return K~=nil and O[K]or nil;
end;
t.key=function(K)if K==nil then
    return nil;
end;
return T[K]or T[tonumber(K)or K];
end;
t.on=function(K,o)if K then
    x[#x+1]=K;
end;
if o then
    p[#p+1]=o;
end;
end;
j=b:FindFirstChild("Combatants");
if j then
    S(j);
end;
h.connect(b.ChildAdded,function(j)if j.Name=="Combatants"then if j:IsA("Folder")then
    S(j);
end;
end;
end);
h.teardown(function()table.clear(Y);
table.clear(O);
table.clear(T);
table.clear(x);
table.clear(p);
table.clear(G);
i=0;
end);
return t;
end;

D.h=function()local j,h,b,K=D.load("b"),D.load("f"),D.load("a"),D.load("g");
local S=j.players;
local o,t,G,i=h.trim,{},0,true;
local h=-1;
local function Y()i=true;
end;
local function O()i=true;
task.defer(Y);
end;
b.connect(S.PlayerAdded,Y);
b.connect(S.PlayerRemoving,O);
j={all=function()local Y,O=i;
if Y then
    O=Y;
else
    local T=h;
    O=T~=K.version;
end;
if O then
    i=false;
    h=K.version;
    Y=S:GetPlayers();
    local h=#Y;
    for S=1,h,1 do
        t[S]=Y[S];
    end;
    local S,Y=K.list();
    for K=1,Y,1 do
        h+=1;
        t[h]=S[K];
    end;
    o(t,h);
    G=h;
end;
O=G;
return t,O;
end,reset=function()o(t,0);
G,i=0,true;
end
};
b.teardown(j.reset);
return j;
end;

D.i=function()return{vis=true,aim=false,mem=30,age=0.3,err=24,peek=0.25};
end;

D.j=function()local j=D.load("b").storage;
local function h(...)local b=j;
for j=1,select("#",...),1 do
    local K,S=pcall(b.WaitForChild,b,select(j,...),5);
    if K then
        if not(S)then
            return nil;
        end;
    else
        return nil;
    end;
    b=S;
end;
local j,K=pcall(require,b);
if j then
    return K;
end;
return nil;
end;
local j={weapon=h("Components","Weapon"),bullet=h("Components","Weapon","Classes","Bullet"),grenade=h("Components","Grenade"),raycast=h("Shared","Raycast"),ray_ignore=h("Components","Common","GetRayIgnore"),remotes=h("Database","Security","Remotes"),camera=h("Controllers","CameraController"),local_char=h("Controllers","CharacterController","LocalCharacter"),inventory=h("Controllers","InventoryController"),data=h("Controllers","DataController"),hints=h("Controllers","HintController"),spectate=h("Controllers","SpectateController"),runstep=h("Controllers","RunServiceController"),pose=h("Components","Common","CharacterPose"),char_velocity=h("Components","Common","GetCharacterVelocity"),char_resolver=h("Components","Common","CharacterResolver"),skin_info=h("Components","Common","GetResolvedSkinInformation"),weapon_props=h("Components","Common","GetWeaponProperties"),skins=h("Database","Components","Libraries","Skins"),buy_area=h("Database","Components","Common","IsInBuyArea"),buy_menu=h("Interface","Screens","Gameplay","Middle","BuyMenu"),defuse_ui=h("Interface","Screens","Gameplay","Middle","DefuseBomb"),crosshair=h("Interface","Screens","Gameplay","Middle","Crosshair"),mv_runtime=h("MovementV2","Client","Runtime"),constants=h("Database","Custom","Constants"),nade_sim=h("Shared","GrenadeSimulator"),kinematics=h("MovementV2","RuntimeKinematics"),snap_codec=h("MovementV2","RemoteSnapshotCodec"),root_frame=h("MovementV2","RootFrame"),viewmodel=h("Classes","WeaponComponent","Classes","Viewmodel"),character=h("Classes","Character"),flash_fx=h("Components","Common","VFXLibary","FlashEffect"),smoke_fx=h("Components","Common","VFXLibary","CreateVoxelSmoke"),tracer_fx=h("Components","Common","VFXLibary","CreateTracer"),vm_flash=h("Components","Common","VFXLibary","CreateMuzzleFlash","Camera"),emit_fx=h("Components","Common","VFXLibary","CreateMuzzleFlash","EmitParticles"),tp_model=h("Controllers","Observers","Players","Components","CreateWeaponModel"),platform=h("Components","Common","GetUserPlatform"),mobile_shoot=h("Controllers","MobileAutoShootController"),hit_flinch=h("Controllers","CharacterController","HitFlinch")};
local h,b=j.weapon,j.bullet;
j.fire_ready=type(h)=="table"and type(h.shoot)=="function";
j.legit_ready=type(b)=="table"and type(j.raycast)=="table"and type(j.ray_ignore)=="function";
return j;
end;

D.k=function()local j,h,b=D.load("b"),D.load("j"),D.load("g");
local K=j.lp;
local S=j.workspace;
local o,t=j.storage,h.kinematics;
local G=Vector3.zero;
local i=Vector3.new;
local Y=math.min;
local O=math.max;
local T,x,p=math.atan2,{["Counter-Terrorists"]=true,Terrorists=true},{run=19.5,walk=0.52,duck=0.34,scope=0.6};
h=o:FindFirstChild("MovementV2");
h=h and(h:FindFirstChild("SpeedProfile"));
if h then
    if h:IsA("ModuleScript")then
        j,o=pcall(require,h);
        if j then
            if type(o)=="table"then if type(o.TopSpeed)=="number"then if o.TopSpeed>0 then
                p.run=o.TopSpeed;
            end;
        end;
        if type(o.WalkModifier)=="number"then if o.WalkModifier>0 then
            p.walk=o.WalkModifier;
        end;
    end;
    if type(o.CrouchModifier)=="number"then if o.CrouchModifier>0 then
        p.duck=o.CrouchModifier;
    end;
end;
end;
end;
end;
end;
local j={spd=p,slots={}};
local h=j.slots;
local function o(A)local M=A.LookVector;
return T(-M.X,-M.Z);
end;
local function T(A,M)if t then
    if type(t.getVelocity)=="function"then local a,B=pcall(t.getVelocity,A,M);
    if a then
        if typeof(B)=="Vector3"then return B;
    end;
end;
end;
end;
return M.AssemblyLinearVelocity;
end;
local function t(A)if typeof(A)~="Vector3"then return G;
end;
return i(A.X,0,A.Z);
end;
j.slot=function(i)local A=h[i];
if A then
else
    A={plr=i,mode="none",pos=nil,at=0,hit=0,vel=G,yaw=0,err=0,gen=nil,live=nil,cur=nil,cerr=0,ghost=nil,stand=nil,duck=nil,snap=0,spos=nil,svel=G,syaw=0,dk=0,void=false,seen=nil,peek=0};
    h[i]=A;
end;
return A;
end;
j.drop=function(i)h[i]=nil;
end;
j.frozen=function()return S:GetAttribute("GameState")=="Buy Period";
end;
j.who=function(i)return typeof(i)=="Instance"or b.is(i);
end;
local function b(i)return i:GetAttribute("CharacterGeneration")or i:GetAttribute("Generation");
end;
j.dead=function(i)if i:GetAttribute("Dead")~=false then
    return true;
end;
local A=i:GetAttribute("Health");
if type(A)=="number"then if A<=0 then
    return true;
end;
end;
local M=i.Character;
if M then
    if M:GetAttribute("Dead")==true then
        return true;
    end;
    A=M:GetAttribute("Health");
    if type(A)=="number"then if A<=0 then
        return true;
    end;
end;
end;
A=h[i];
return A~=nil and A.died~=nil and os.clock()-A.died<2 and A.died_gen==b(i);
end;
j.kill=function(h)h.died=os.clock();
h.died_gen=b(h.plr);
h.mode="none";
h.live=nil;
end;
j.enemy=function(h)if h==K then
    return false;
elseif  not(j.who(h))then
    return false;
end;
local i=h:GetAttribute("Team");
if not(x[i])then
    return false;
end;
if S:GetAttribute("Gamemode")=="Deathmatch"then return true;
end;
return i~=K:GetAttribute("Team");
end;
j.shown=function(h)local K=h.Character;
if K then
    if K.Parent then
        if not(K:IsDescendantOf(S))then
            return nil;
        end;
    else
        return nil;
    end;
else
    return nil;
end;
if K:GetAttribute("Dead")==true then
    return nil;
elseif  K:GetAttribute("ClientCharacterPresentationVisible")==false then
    return nil;
end;
h=K:FindFirstChild("HumanoidRootPart");
if h then
    if not(h:IsA("BasePart"))then
        return nil;
    end;
else
    return nil;
end;
return K,h;
end;
j.spawn=function(h,K,S)local i=h.plr;
local x,A,M=i:GetAttribute("PresentationSpawnPosition"),i:GetAttribute("PresentationSpawnYaw"),1;
h.stand=nil;
h.duck=nil;
h.void=false;
h.seen=nil;
if S then
    if K-h.snap<1 and h.spos then
        x,A,M=h.spos,h.syaw,0.3;
    else
        x=if j.frozen()then
            x
        else
            nil;
        end;
    else
    end;
    if typeof(x)~="Vector3"then h.mode="none";
    h.live=nil;
    return;
end;
h.pos=x;
h.at=K;
h.hit=0;
h.vel=G;
h.err=M;
h.yaw=type(A)=="number"and A or 0;
h.mode="est";
end;
j.snap=function(h,K,S,i,x,A)h.snap=A;
h.spos=K;
h.svel=t(S);
h.syaw=type(i)=="number"and i or h.syaw;
h.dk=type(x)=="number"and x or 0;
if h.mode=="live"then return;
elseif  j.dead(h.plr)then
    return;
end;
h.pos=K;
h.vel=h.svel;
h.yaw=h.syaw;
h.at=A;
h.hit=A;
h.err=0.3;
h.mode="est";
h.void=false;
h.seen=nil;
end;
j.sync=function(h,K,S)local i=h.plr;
if j.dead(i)then
    h.mode="none";
    h.live=nil;
    return;
end;
local x=b(i);
if x~=h.gen then
    local b=h.gen==nil;
    h.gen=x;
    j.spawn(h,K,b);
end;
local b,A=j.shown(i);
if b then
    x=A.CFrame;
    h.pos=x.Position;
    h.vel=t(T(b,A));
    h.yaw=o(x);
    h.at=K;
    h.hit=K;
    h.err=0.5;
    h.mode="live";
    h.live=b;
    h.void=false;
    h.seen=nil;
    return;
end;
if h.mode=="live"then h.mode="est";
h.live=nil;
h.void=false;
h.seen=nil;
if h.spos then
    if K-h.snap<0.25 then
        h.pos=h.spos;
        h.vel=h.svel;
        h.yaw=h.syaw;
        h.at=h.snap;
        h.hit=h.snap;
        h.err=0.3;
    else
        h.at=K;
    end;
else
    h.at=K;
end;
end;
if S then
    if h.mode=="est"then h.at=K;
    h.vel=G;
end;
end;
end;
j.crouched=function(h,b)if b-h.snap<0.5 then
    return h.dk>=0.5;
end;
return h.plr:GetAttribute("IsCrouching")==true;
end;
j.guess=function(h,b)local K,S=h.pos,b-h.at;
if K then
    if S<=0 then
        return K,h.err;
    end;
else
    return K,h.err;
end;
local o=h.plr;
local t,G=if j.crouched(h,b)then
    p.run*p.duck
else
    if o:GetAttribute("IsWalking")==true then
        p.run*p.walk
    else
        if o:GetAttribute("IsSniperScoped")==true then
            p.run*p.scope
        else
            p.run,h.vel;
            local b,o,i=G.Magnitude,K+G*Y(S,0.3),S-0.3;
            if i<=0 then
                return o,h.err;
            end;
            return if b>0.5 then
                if t>0 then
                    o+G*(Y(b,t)/b*Y(i,1.5))
                else
                    o
                else
                    o,h.err+i*O(t,3);
                end;
                return j;
            end;

D.m=function()local j,h=D.load("b"),D.load("a");
local b,K=D.load("j"),D.load("g");
local S=D.load("k");
local o=j.players;
local j=b.remotes;
local b,t=S.slots,{};
local function G(i)if type(i)~="table"then return;
end;
local Y=tonumber(i.Victim);
if not(Y)then
    return;
end;
i=Y>0 and o:GetPlayerByUserId(Y)or K.key(Y);
Y=i and b[i];
if Y then
    S.kill(Y);
end;
end;
local b=false;
t.start=function()if b then
    return;
end;
b=true;
h.spawn(function()local b=j and j.UI;
local j=type(b)=="table"and b.UIPlayerKilled or nil;
if type(j)~="table"then return;
elseif  type(j.Listen)~="function"then return;
end;
local b,K=pcall(j.Listen,function(j)pcall(G,j);
end);
if b then
    if type(K)=="function"then h.adopt(K);
end;
end;
end);
end;
return t;
end;

D.n=function()local j,h=D.load("b"),D.load("a");
local b,K=D.load("j"),D.load("g");
local S=D.load("i");
local o=D.load("k");
local t=j.lp;
local G=j.players;
local i=j.storage;
local j,Y,O=b.snap_codec,b.root_frame,os.clock;
local b=Vector3.new;
local T=type(j)=="table"and j.decode or nil;
local x=type(j)=="table"and j.applyDeltaToCanonicalBaseline or nil;
local j,p,A=type(Y)=="table"and Y.simulationToVisualRootPosition or nil,{};
local Y,M={};
local a={};
local B,N,I=-1,{},{tick=-1,at=0};
local function R(n)local E,d=n.Position,n.DuckAmount or 0;
if j then
    local n,w=pcall(j,E,d);
    if n then
        if typeof(w)=="Vector3"then return w;
    end;
end;
end;
return E-b(0,(d>=0.999 and 4.05 or 5.4)*0.5-3,0);
end;
local function j(b)if type(b)~="number"then return nil;
elseif  b<=0 then
    return nil;
end;
local n=N[b];
if n==nil or n.Parent~=G then
    n=G:GetPlayerByUserId(b)or false;
    N[b]=n;
else
end;
return n or nil;
end;
local function b(n,E)for d,w in n,nil,nil do
    d=j(w.UserId)or K.actor(w.ActorId);
    if d then
        if d~=t then
            if o.enemy(d)then
                o.snap(o.slot(d),R(w),w.Velocity,w.LookYaw,w.DuckAmount,E);
            end;
        end;
    end;
end;
end;
local function j(K,o)local t=K.Sequence;
if t==A then
    return;
end;
if t~=M then
    M,Y=t,{};
    table.clear(a);
end;
local R=K.ChunkIndex or 0;
if a[R]then
    return;
end;
a[R]=true;
R=K.Actors or{};
for n,E in R,nil,nil do
    n=Y;
    n[E.ActorId]=E;
end;
local n=K.ServerTick;
if type(n)=="number"then if n>=B then
    B=n;
    I.tick=n;
    I.at=o;
    b(R,o);
end;
end;
R,o=K.ChunkCount or 1,0;
for K in a,nil,nil do
    o+=1;
end;
if o>=R then
    p,A,Y,M=Y,t,{},nil;
    table.clear(a);
end;
end;
local function K(o,t)local R=o.ServerTick;
if type(R)~="number"then return;
elseif  R<=B then
    return;
end;
B=R;
I.tick=R;
I.at=t;
local B,n={},0;
if o.BaselineSequence==A then
    R={};
    for E,E in o.RemovedActorIds or{},nil,nil do
        R[E]=true;
    end;
    local E={};
    if x then
        local d=o.Deltas or{};
        for w,P in d,nil,nil do
            w=p;
            local d=w[P.ActorId];
            if d then
                if not(R[P.ActorId])then
                    local w,r=pcall(x,d,P);
                    if w then
                        if type(r)=="table"then E[P.ActorId]=r;
                    end;
                end;
            end;
        end;
    end;
end;
local x=p;
for d,w in x,nil,nil do
    if R[d]then
    else
        n+=1;
        B[n]=E[d]or w;
    end;
end;
else
end;
for x,x in o.Actors or{},nil,nil do
    n+=1;
    B[n]=x;
end;
b(B,t);
end;
local function b(o)if S.vis then
    if not(T)then
        return;
    end;
elseif  S.aim then
    if not(T)then
        return;
    end;
else
    return;
end;
local S,t=pcall(T,o);
if S then
    if type(t)~="table"then return;
end;
else
    return;
end;
S=O();
if t.Kind=="Baseline"then j(t,S);
elseif  t.Kind=="Delta"then K(t,S);
end;
end;
local j=false;
I.start=function()if j then
    return;
elseif  not(T)then
    return;
end;
j=true;
h.spawn(function()local j=i:WaitForChild("MovementV2Remotes",30);
local K=j and(j:WaitForChild("RemoteSnapshot",30));
if not(K)then
    return;
end;
h.connect(K.OnClientEvent,function(j)pcall(b,j);
end);
end);
end;
h.connect(G.PlayerRemoving,function(j)N[j.UserId]=nil;
end);
h.teardown(function()table.clear(p);
table.clear(Y);
table.clear(a);
table.clear(N);
A,M=nil,nil;
end);
return I;
end;

D.o=function()local j,h=D.load("b"),D.load("a");
local b=j.workspace;
local K=j.collection;
local S=j.lp;
local j=os.clock;
local o=string.lower;
local t,G,i,Y,O=string.sub,{barriers=true,pvscells=true,pvsvolumes=true,pvsstaticocclusion=true,pvsvisibilitygeometry=true},{"BreakableDoor","BreakableGlass","Ceiling Fan","Flag","Flower Pot","Garage","Market Window","Snowman","Television","TugBoat","Vent","VertigoCar","VertigoCrane","VertigoGenerator","Water"},{"BreakableDoor","BreakableGlass","Garage","Market Window","Vent"},{};
O[Enum.Material.Glass]=true;
O[Enum.Material.ForceField]=true;
local T={["Counter-Terrorists"]=true,Terrorists=true};
local x=Enum.AlphaMode.Transparency;
local p=RaycastParams.new();
p.FilterType=Enum.RaycastFilterType.Include;
p.IgnoreWater=true;
p.RespectCanCollide=false;
local A,M={ready=false};
local a=0;
local function B(N,I)return N:GetAttribute(I)==true or K:HasTag(N,I);
end;
local function N(I,R)for n=1,#R,1 do
    if K:HasTag(I,R[n])then
        return true;
    end;
end;
return false;
end;
local function K(I)return B(I,"PVSIgnore")or B(I,"PVSDynamic")or N(I,i);
end;
local function i(I)local R=o(I);
return G[R]==true or t(R,1,24)=="__pvsvisibilityobjstage_";
end;
local function o(t)if t.Anchored then
    if O[t.Material]then
        return false;
    elseif  t.Transparency>0.01 then
        return false;
    end;
else
    return false;
end;
local G=t:GetChildren();
for O=1,#G,1 do
    t=G[O];
    if t:IsA("SurfaceAppearance")then
        if t.AlphaMode==x then
            return false;
        end;
    end;
end;
return true;
end;
local function t(G)return G:GetAttribute("PVSNegativeAuthority")~=nil or G:GetAttribute("PVSVisibilityGeometryVersion")~=nil or G:GetAttribute("PVSVisibilityGeometryComplete")~=nil or G:GetAttribute("PVSVisibilityGeometryFingerprint")~=nil;
end;
local function G(O,x,I)if i(O.Name)then
    return 0;
end;
local R,n,E,d,w,P,r={O},{B(O,"PVSOccluder")},{K(O)},1,0,0,(j());
while d>0 do
    local L,Z,X=R[d],n[d],E[d];
    R[d]=nil;
    n[d]=nil;
    E[d]=nil;
    d-=1;
    if Z then
        if X then
        else
            if L:IsA("BasePart")then
                if o(L)then
                    O=w+1;
                    x[O]=L;
                    w=O;
                else
                end;
            else
            end;
        end;
    else
    end;
    local o=L:GetChildren();
    for O=1,#o,1 do
        L=o[O];
        if i(L.Name)then
        else
            d+=1;
            R[d]=L;
            n[d]=Z or B(L,"PVSOccluder");
            E[d]=X or K(L);
        end;
    end;
    P+=1;
    if P%64==0 then
        if j()-r>0.004 then
            task.wait();
            if not(I())then
                return nil;
            end;
            r=(j());
        else
        end;
    else
    end;
end;
return w;
end;
local function K(o,i,O)local x=o:FindFirstChild("Barriers")or o:FindFirstChild("Barriers",true);
if not(x)then
    return 0;
end;
o=x:GetDescendants();
o[#o+1]=x;
local B,I=0,(j());
for R=1,#o,1 do
    local n=o[R];
    if n:IsA("BasePart")and n.CanQuery and(n:IsA("Part")or n:IsA("WedgePart")or n:IsA("CornerWedgePart"))then
        local o,E=n,false;
        while o do
            local d=E;
            if o:GetAttribute("PVSIgnore")==true or N(o,Y)then
                E=true;
                break;
            end;
            if o==x then
                E=d;
                break;
            end;
            o=o.Parent;
        end;
        if E then
        else
            B+=1;
            i[B]=n;
        end;
    else
    end;
    if R%64==0 then
        if j()-I>0.004 then
            task.wait();
            if not(O())then
                return nil;
            end;
            I=(j());
        else
        end;
    else
    end;
end;
return B;
end;
local function j(o)a+=1;
local i=a;
M=o;
A.ready=false;
p.FilterDescendantsInstances={};
if not o then
    return;
end;
h.spawn(function()local function Y()local O=a==i and o.Parent~=nil;
return O;
end;
for i=1,5,1 do
    if not(Y())then
        return;
    end;
    local O,x={},t(o);
    local t=(x and G or K)(o,O,Y);
    if t then
        if not(Y())then
            return;
        end;
    else
        return;
    end;
    local K=x and tonumber(o:GetAttribute("PVSVisibilityExportExpectedParts"))or nil;
    if t>0 and((if K then
        t>=K*0.9
    else
        not K)or i==5)then
            x=b:FindFirstChildOfClass("Terrain");
            if x then
                O[t+1]=x;
            end;
            p.FilterDescendantsInstances=O;
            A.ready=true;
            return;
        end;
        task.wait(2);
    end;
end);
end;
local function K()local o=b:FindFirstChild("Map");
if o then
    if o:GetAttribute("MapName")~=nil then
        return o;
    end;
end;
return nil;
end;
A.sync=function()local o=K();
if o~=M then
    j(o);
end;
return A.ready;
end;
A.eye=function()if A.ready then
    if not(T[S:GetAttribute("Team")])then
        return nil;
    end;
else
    return nil;
end;
local j=S.Character;
if j then
    if j:GetAttribute("Dead")~=false then
        return nil;
    elseif  not(j:IsDescendantOf(b))then
        return nil;
    end;
else
    return nil;
end;
local K=j:FindFirstChild("CameraPart")or j:FindFirstChild("Head");
if K then
    if K:IsA("BasePart")then
        return K.Position;
    end;
end;
return nil;
end;
A.clear=function(j,K)return b:Raycast(j,K-j,p)==nil;
end;
h.teardown(function()a+=1;
M=nil;
A.ready=false;
p.FilterDescendantsInstances={};
end);
return A;
end;

D.p=function()local j,h,b=D.load("b"),D.load("a"),D.load("h");
local K,S=D.load("g"),D.load("i");
local o=D.load("k");
local t=D.load("l");
local G,i,Y=D.load("m"),D.load("n"),D.load("o");
local O,T=j.players,j.lp;
local j=os.clock;
local x=o.slots;
local p=t.owners;
local A=math.clamp;
local M=math.min;
local a=CFrame.new;
local B,N=CFrame.Angles,{cfg=S,state=o,snap=i,sight=Y};
local function I(R)local n=x[R];
if n then
    t.drop(n);
    o.drop(R);
end;
end;
local function R(n,E)return n.mode=="est"and not n.void and n.ghost~=nil and n.cur~=nil and E-n.at<=S.mem and n.cerr<=S.err;
end;
local function n(E,d,w,P,r)if P-E.peek<0.05 then
    return;
end;
E.peek=P;
local L=d.parts;
local d,Z=L.Head,L.UpperTorso;
if d and Y.clear(w,d.Position)or Z and Y.clear(w,Z.Position)then
    L=E.seen;
    if L then
        if P-L>=r then
            E.void=true;
        end;
    else
        E.seen=P;
    end;
else
    E.seen=nil;
end;
end;
N.step=function()if not(S.vis)then
    if not(S.aim)then
        return;
    end;
end;
local E,d,w,P,r,L=j(),o.frozen(),Y.sync()and Y.eye()or nil,S.peek+A(tonumber(T:GetAttribute("Ping"))or 100,0,500)/1000,b.all();
for b=1,L,1 do
    local Y=r[b];
    if o.enemy(Y)then
        b=o.slot(Y);
        o.sync(b,E,d);
        if b.mode=="live"then t.learn(b,b.live,o.crouched(b,E),E);
    elseif  b.mode=="est"then local T,d=o.guess(b,E);
    b.cur=T;
    b.cerr=d;
    if T then
        d=t.pick(b,o.crouched(b,E));
        if d then
            local r=t.ghost(b,d);
            t.place(r,d,a(T)*B(0,b.yaw,0));
            t.mirror(r,Y);
            if w then
                if R(b,E)then
                    n(b,r,w,E,P);
                end;
            end;
        end;
    end;
end;
elseif  x[Y]then
    I(Y);
end;
end;
end;
N.char=function(b)if S.vis then
    if not(o.who(b))then
        return nil;
    end;
else
    return nil;
end;
local Y=x[b];
if not(Y)then
    return nil;
end;
if Y.mode=="live"then return Y.live;
end;
if R(Y,j())then
    return Y.ghost.model;
end;
return false;
end;
N.armed=function(b,Y)if not(S.aim)then
    return false;
end;
local T=x[b];
return T~=nil and T.mode=="est"and not T.void and T.ghost~=nil and T.ghost.model==Y and j()-T.hit<=S.age;
end;
N.target=function(b)local Y=S.aim and x[b];
if Y then
    if Y.mode=="est"then if not(Y.void)then
        if Y.ghost then
            if j()-Y.hit<=S.age then
                return Y.ghost.model;
            end;
        end;
    end;
end;
end;
return b.Character;
end;
N.ghost=function(b)return b~=nil and p[b]~=nil;
end;
N.fade=function(b)local Y=o.who(b)and x[b];
if Y then
    if Y.mode~="est"then return 1;
end;
else
    return 1;
end;
b=j();
if b-Y.hit<0.25 then
    local o=Y.cerr;
    if o then
        if o<=1 then
            return 1;
        end;
    else
        return 1;
    end;
end;
return A(M(1-(Y.cerr or 0)/S.err,1-(b-Y.at)/(S.mem>0 and S.mem or 1))*0.85,0.2,0.85);
end;
N.info=function(b)local S=x[b];
if not(S)then
    return nil;
end;
return S.mode,S.cur or S.pos,S.cerr,j()-S.at,j()-S.snap,S.void;
end;
h.connect(O.PlayerRemoving,I);
K.on(nil,I);
h.teardown(function()for j,h in x,nil,nil do
    t.drop(h);
    x[j]=nil;
end;
end);
G.start();
i.start();
return N;
end;

D.q=function()local j=Color3.new(1,1,1);
local h={white=j};
h.black=Color3.new();
h.world={fog=false,fog_col=j,fog_start=0,fog_end=500,time=false,time_hour=12,bloom=false,bloom_power=100,bloom_size=24,bloom_limit=200,hands=false,hands_x=0,hands_y=0,hands_z=0,sky=false,sky_preset="jungle",fx=false,fx_type="snow",fx_col=j,fx_rate=250,ambient=false,ambient_col=j,exposure=false,exposure_val=0,fullbright=false,fb_col=j,fb_power=200,no_shadows=false,xhair=false,xhair_col=j,xhair_size=100,xhair_gap=6,force_xhair=false,pen=false,pen_yes=Color3.fromRGB(50,255,115),pen_no=Color3.fromRGB(255,65,75),pen_size=12,third=false,third_dist=10,cc=false,cc_tint=j,cc_sat=0,cc_bright=0,cc_contrast=0,body_chams=false,body_chams_col=j,body_chams_mat="forcefield",tool_chams=false,tool_chams_col=j,tool_chams_mat="forcefield",tool_chams_kinds=nil,hand_chams=false,hand_chams_col=j,hand_chams_mat="forcefield",tracers=false,tracers_col=j,tracers_width=0.05,tracers_life=1.2,impacts=false,impacts_col=j,impacts_life=3,bomb_esp=false,bomb_icon_col=j,bomb_timer_col=j,bomb_timer_grad=false,bomb_timer_grad_col=j,nade_path=false,nade_path_col=j,nade_radius_col=j,nade_path_width=2,nade_zones=false,smoke_zone_col=j,smoke_zone_icon=j,fire_zone_col=j,fire_zone_icon=j,nades_live=false,nade_icon_col=j,nade_dmg_col=j,esp_set=nil,view=nil,zonefill=nil};
h.misc={scope=false,flash=false,smoke=false,hands=false,bullets=false,auto_plant=false,auto_defuse=false,knife=false,knife_heavy=true,knife_range=3.5,zeus=false,zeus_range=12,auto_reload=false,auto_reload_min=1,auto_buy=false,buy_primary="AK-47",buy_secondary="USP-S",buy_zeus=false,buy_nades={},buy_dirty=true};
local b=Color3.fromRGB(133,220,255);
h.notify={master={hit=false,kill=false},log={hit=false,kill=false},fx={hit={on=false,col=b},kill={on=false,col=b}},screen={hit={on=false,col=b,power=100},kill={on=false,col=b,power=100}},marks={hit={on=false,col=j,size=18,fade=1},kill={on=false,col=j,size=18,fade=1}},sounds={hit={on=false,name="mc bow",vol=1},kill={on=false,name="skeet",vol=1}},list={"primordial","neverlose","sparkle","mc bow","skeet","break","rust","applepay","bubble","combobreak","killcard","xp","na naxuy","stony","hentai"}};
h.attach=function(j)h.world.esp_set=j.shSet;
h.world.view=j.ViewResolver;
end;
return h;
end;

D.s=function()local j=D.load("b");
local h,b=D.load("a"),j.workspace;
local K=j.storage;
local S=j.guiservice;
local o=j.custom_asset;
local t=math.floor;
local G,G=math.round,math.sin;
local i=math.cos;
local Y=math.tan;
local O=math.rad;
local T=math.huge;
local x=math.max;
local p=table.create;
local A=Color3.new(1,1,1);
local M={white=A};
M.hb_off=Vector2.new(5,0);
M.ht_off=Vector2.new(3,0);
M.ho_off=Vector2.new(0,1);
M.bb_off=Vector2.new(0,5);
M.bo_off=Vector2.new(1,0);
M.bt_off=Vector2.new(0,3);
M.n_off=Vector2.new(0,2);
M.d_off=Vector2.new(0,2);
M.ab_off=Vector2.new(5,0);
M.at_off=Vector2.new(12,0);
M.ao_off=Vector2.new(0,1);
local a={};
m:rH(a,0,Vector3.new(-1,-1,-1),Vector3.new(-1,1,-1),Vector3.new(-1,1,1),Vector3.new(-1,-1,1),Vector3.new(1,-1,-1),Vector3.new(1,1,-1),Vector3.new(1,1,1),Vector3.new(1,-1,1));
M.verts=a;
local B={Head=true,UpperTorso=true,LowerTorso=true,LeftUpperArm=true,LeftLowerArm=true,LeftHand=true,RightUpperArm=true,RightLowerArm=true,RightHand=true,LeftUpperLeg=true,LeftLowerLeg=true,LeftFoot=true,RightUpperLeg=true,RightLowerLeg=true,RightFoot=true,Torso=true,["Left Arm"]=true,["Right Arm"]=true,["Left Leg"]=true,["Right Leg"]=true};
M.body_parts=B;
local N=protect_gui or syn and syn.protect_gui;
local function I(R)if type(N)=="function"then pcall(N,R);
end;
end;
local N=Instance.new("Folder");
I(N);
N.Parent=j.host;
h.own(N);
local R=Instance.new("ScreenGui");
R.ResetOnSpawn=false;
R.IgnoreGuiInset=true;
R.DisplayOrder=100;
I(R);
pcall(function()R.Parent=j.host;
end);
h.own(R);
M.holder=N;
M.av_gui=R;
local h,N={},"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
for I=1,64,1 do
    h[N:sub(I,I)]=I-1;
end;
local function N(I)I=I:gsub("^data:[^,]+,",""):gsub("%s",""):gsub("%-","+"):gsub("_","/");
local R,n={},0;
for E=1,#I,4 do
    local d,w,P,r=h[I:sub(E,E)]or 0,h[I:sub(E+1,E+1)]or 0,I:sub(E+2,E+2),I:sub(E+3,E+3);
    local I,L=h[P]or 0,h[r]or 0;
    E=d*262144+w*4096+I*64+L;
    n+=1;
    R[n]=string.char(t(E/65536)%256);
    if P~="="then n+=1;
    R[n]=string.char(t(E/256)%256);
else
end;
if r~="="then n+=1;
R[n]=string.char(E%256);
else
end;
end;
return table.concat(R);
end;
M.from_base64=N;
local h=""; -- Off-screen arrows are not part of DaDa.
local I;
M.arrow=function()if I~=nil then
    local R=I;
    return R;
end;
if type(h)~="string"then I="";
local R=I;
return R;
elseif  h==""then I="";
local R=I;
return R;
end;
if h:sub(1,13)=="rbxassetid://"then I=h;
local R=I;
return R;
elseif  h:sub(1,8)=="https://"then I=h;
local R=I;
return R;
elseif  h:sub(1,7)=="http://"then I=h;
local R=I;
return R;
end;
if type(writefile)~="function"then I="";
local R=I;
return R;
elseif  type(o)~="function"then I="";
local R=I;
return R;
end;
local R=N(h);
local h="bs_arrow."..(R:sub(1,3)=="\255\216\255"and"jpg"or"png");
if not(pcall(writefile,h,R))then
    I="";
    local N=I;
    return N;
end;
local N,R=pcall(o,h);
I=N and R or"";
R=I;
return R;
end;
local h=j.weak();
local function o(N,I)N.ZIndex=I;
end;
M.set_depth=function(N,I)if h[N]~=I then
    h[N]=I;
    pcall(o,N,I);
end;
end;
M.is_body=function(h)return B[h]==true;
end;
M.is_char_part=function(h)return h:IsA("BasePart")and h.Name~="HumanoidRootPart"and h.Name~="GlowShell";
end;
local function h(o)return o.HasSkinnedMesh;
end;
M.is_deformable=function(o)if o:FindFirstChildWhichIsA("WrapLayer")then
    return true;
end;
if B[o.Name]==true then
    return false;
end;
if o:FindFirstChildWhichIsA("Bone")then
    return true;
end;
local N,I=pcall(h,o);
return N and I==true;
end;
local function h(o,N)o.Archivable=N;
end;
M.safe_clone=function(o)local N=o.Archivable;
if not(N)then
    if not(pcall(h,o,true))then
        return nil;
    end;
end;
local I,R=pcall(o.Clone,o);
if not(N)then
    pcall(h,o,N);
end;
if not(I)then
    return nil;
end;
return R;
end;
M.is_valid_part=function(h)if h then
    if h.Parent then
        if not(h:IsA("BasePart"))then
            return false;
        end;
    else
        return false;
    end;
else
    return false;
end;
if h.Name=="HumanoidRootPart"then return false;
elseif  h.Name=="GlowShell"then return false;
end;
local o=h.Size;
return o.X~=0 or o.Y~=0 or o.Z~=0;
end;
M.char_parts=function(h,o)local N,I=o or{},0;
if h then
    if h.Parent then
        local R,n=h:GetChildren(),I;
        for h=1,#R,1 do
            o=R[h];
            if B[o.Name]then
                if o:IsA("BasePart")then
                    if M.is_valid_part(o)then
                        h=n+1;
                        N[h]=o;
                        n=h;
                    else
                    end;
                else
                end;
            else
            end;
        end;
        I=n;
    else
    end;
else
end;
for h=#N,I+1,-1 do
    N[h]=nil;
end;
return N,I;
end;
M.bounds=function(h,o)o=o or h and#h or 0;
if o==0 then
    return nil,nil;
end;
local B,N,I,R,n,E,d=1000000000,1000000000,1000000000,-1000000000,-1000000000,-1000000000,0;
for w=1,o,1 do
    local o=h[w];
    if o then
        if o.Parent then
            w=o.Size;
            local h,P,r=w.X,w.Y,w.Z;
            if h~=0 or P~=0 or r~=0 then
                local w,L,Z,X=o.Position,h*0.5,P*0.5,r*0.5;
                local h,o,P,r,q,U=w.X-L,w.X+L,w.Y-Z,w.Y+Z,w.Z-X,w.Z+X;
                B,N,I,R,n,E=if h<B then
                    h
                else
                    B,if P<N then
                        P
                    else
                        N,if q<I then
                            q
                        else
                            I,if o>R then
                                o
                            else
                                R,if r>n then
                                    r
                                else
                                    n,if U>E then
                                        U
                                    else
                                        E;
                                        w=d+1;
                                        d=w;
                                    else
                                    end;
                                else
                                end;
                            else
                            end;
                        end;
                        if d==0 then
                            return nil,nil;
                        end;
                        local h,o,d=(B+R)*0.5,(N+n)*0.5,(I+E)*0.5;
                        return CFrame.new(Vector3.new(h,o,d),Vector3.new(h,o,E)),Vector3.new(R-B,n-N,E-I);
                    end;
                    local h;
                    local function o()return require(K.Controllers.SpectateController);
                end;
                local function K()if h~=nil then
                    local B=h;
                    return B;
                end;
                local B,N=pcall(o);
                h=if B then
                    if type(N)=="table"then if type(N.GetCurrentSpectateInstance)=="function"then N
                else
                    false
                else
                    false
                else
                    false;
                    N=h;
                    return N;
                end;
                local h=b.CurrentCamera;
                local o=h and h.ViewportSize or Vector2.new(1920,1080);
                local B=h and h.CFrame or CFrame.new();
                local N,I,R,n=h and h.FieldOfView or 70,false,0,{vs=o,foc=0};
                M.rt=n;
                local function E(d)return d:getPosition();
            end;
            local function d()local w=b.CurrentCamera;
            if not(w)then
                return;
            end;
            h=w;
            B=w.CFrame;
            N,I=w.FieldOfView,false;
            local b=K();
            if not(b)then
                return;
            end;
            local K,P=pcall(b.GetCurrentSpectateInstance);
            if K then
                if type(P)~="table"then return;
            elseif  P.PerspectiveState~="First-Person"then return;
        end;
    else
        return;
    end;
    b,K=P.CameraPositionSpring,P.CameraRotationSpring;
    if b then
        if not K then
            return;
        end;
    else
        return;
    end;
    local P,r=pcall(E,b);
    if P then
        if typeof(r)~="Vector3"then return;
    end;
else
    return;
end;
P,b=pcall(E,K);
if P then
    if typeof(b)~="Vector3"then return;
elseif  b.Magnitude<1.0E-4 then
    return;
end;
else
    return;
end;
if(w.CFrame.Position-r).Magnitude<=2 then
    return;
end;
B,I=CFrame.lookAt(r,r+b),true;
end;
M.resolve_view=d;
local function b(K,E,w,P,r,L)if not(E)then
    return nil,false,-T;
end;
if L then
    local L=w:PointToObjectSpace(K);
    local Z=-L.Z;
    local X,q,U,z=if Z>-1.0E-4 then
        if Z<1.0E-4 then
            Z<0 and-1.0E-4 or 1.0E-4
        else
            Z
        else
            Z,x(r.X,1),x(r.Y,1),Y(O((P or 70)*0.5));
            local P,J=L.X/(X*z*(q/U)),L.Y/(X*z);
            z,L=q*(0.5+P*0.5),U*(0.5-J*0.5);
            P=Z>0.05 and z>=0 and z<=q and L>=0 and L<=U;
            return Vector2.new(z,L),P,Z;
        end;
        r,w=E:WorldToViewportPoint(K);
        return Vector2.new(r.X,r.Y),w,r.Z;
    end;
    M.project_resolved=b;
    M.project_view=function(K)local E,w,P,r=h,B,N,o;
    return b(K,E,w,P,r,true);
end;
local K,E,w,P,r,L,Z,X,q,U,z,J,y,f,k,g=0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,1;
local function Q()K,E,w,P,r,L,Z,X,q,U,z,J=B:GetComponents();
local c,H,_=x(o.X,1),x(o.Y,1),Y(O((N or 70)*0.5));
y=c*0.5;
f,g=H*0.5,_;
k=_*(c/H);
end;
M.to_screen=function(x)local c,H,_=x.X-K,x.Y-E,x.Z-w;
local K,E,w=c*P+H*Z+_*U,c*r+H*X+_*z,-(c*L+H*q+_*J);
x,H,c=if w>-1.0E-4 then
    if w<1.0E-4 then
        w<0 and-1.0E-4 or 1.0E-4
    else
        w
    else
        w,y,y;
        local P,r,L=H+c*(K/(x*k)),f,f;
        H=r-L*(E/(x*g));
        x=w>0.05 and P>=0 and P<=o.X and H>=0 and H<=o.Y;
        return Vector2.new(P,H),x,w;
    end;
    local K={Camera=nil,CFrame=B,ViewportSize=o,FieldOfView=N,Override=false};
    local function x()d();
    if h then
        o=h.ViewportSize;
    end;
    n.vs=o;
    n.foc=o.Y*0.5/Y(O((N or 70)*0.5));
    Q();
    K.Camera=h;
    K.CFrame=B;
    K.ViewportSize=o;
    K.FieldOfView=N;
    K.Override=I;
end;
local n={};
M.resolver=n;
n.Resolve=function()x();
if not(h)then
    return nil;
end;
return K;
end;
n.Project=function(K,E)local d=E or n.Resolve();
if type(d)~="table"then return nil,false,-T;
end;
return b(K,d.Camera,d.CFrame,d.FieldOfView,d.ViewportSize,d.Override==true);
end;
M.begin_frame=function()R+=1;
x();
local b=R;
return b;
end;
M.frame=function()local b=R;
return b;
end;
M.camera=function()local b=h;
return b;
end;
M.viewport=function()local h=o;
return h;
end;
M.view_frame=function()local h=B;
return h;
end;
M.fov=function()local h=N;
return h;
end;
M.overridden=function()local h=I;
return h;
end;
M.calc_corners=function(h,b,K,T)local x,B,N,I=T or(p(8)),o.X,o.Y,h.Position;
local o,p,n,E,d,w=I.X,I.Y,I.Z,b.X*0.5,b.Y*0.5,b.Z*0.5;
b,I=0,0;
for P=1,8,1 do
    h=a[P];
    T=M.to_screen(Vector3.new(o+E*h.X,p+d*h.Y,n+w*h.Z));
    x[P]=T;
    local p,a=T.X,T.Y;
    B,N,b,I=if p<B then
        p
    else
        B,if a<N then
            a
        else
            N,if p>b then
                p
            else
                b,if a>I then
                    a
                else
                    I;
                end;
                h,o,d,T,n=t(B),t(N),t(b),t(I),K or{};
                n.corners=x;
                n.tl=Vector2.new(h,o);
                n.tr=Vector2.new(d,o);
                n.bl=Vector2.new(h,T);
                n.br=Vector2.new(d,T);
                return n;
            end;
            M.calc_corners_viewport=function(h,b,K,o)local T,x=o.AbsoluteSize,o.AbsolutePosition;
            if T.X<=0 or T.Y<=0 then
                return{corners={},tl=Vector2.zero,tr=Vector2.zero,bl=Vector2.zero,br=Vector2.zero};
            end;
            local p,a=(K.CFrame.Position-h.Position).Magnitude,Y(O((K.FieldOfView or 70)/2));
            h,o=T.Y/(2*p*a),T.X/(2*p*a*(T.X/T.Y));
            local K,Y,O,p,B=b.Y*h*1.15,b.X*o,S:GetGuiInset().Y,x.X+T.X/2,x.Y+T.Y/2;
            b,o,T,a=p-Y/2,B-K/2+O,p+Y/2,B+K/2+O;
            return{corners={Vector2.new(b,o),Vector2.new(T,o),Vector2.new(T,a),Vector2.new(b,a),Vector2.new(b,o),Vector2.new(T,o),Vector2.new(T,a),Vector2.new(b,a)},tl=Vector2.new(t(b),t(o)),tr=Vector2.new(t(T),t(o)),bl=Vector2.new(t(b),t(a)),br=Vector2.new(t(T),t(a))};
        end;
        M.rotate=function(h,b)local K,S,o,t=h.X,h.Y,i(b),G(b);
        return Vector2.new(K*o-S*t,K*t+S*o);
    end;
    local h=j.weak();
    M.parse_col=function(j,b,K)local S=b=="Team Color"or j.itf.shSet.useTeam and not K;
    if S then
        K=j.plr;
        local S=h[K];
        if S then
            if S.frame==R then
                return S.col;
            end;
        end;
        local o=j.itf.getTC(K)or A;
        if S then
            S.frame=R;
            S.col=o;
        else
            h[K]={frame=R,col=o};
        end;
        return o;
    end;
    return b;
end;
return M;
end;

D.t=function()local j=D.load("b");
local h,b=D.load("a"),j.guiservice;
local K=math.min;
local S=math.max;
local o,t,G=Vector2.new,{Line={"From","To"},Square={"Position","Size"},Image={"Position","Size"},Text={"Position"},Circle={"Position"},Triangle={"PointA","PointB","PointC"}},{};
for i,Y in t,nil,nil do
    local O={Visible=true};
    for T=1,#Y,1 do
        O[Y[T]]=true;
    end;
    G[i]=O;
end;
local i,Y,O,T,x,p,A,M,a={},0,0,{},0,{},0,{},{};
local function B(N,I,R,n,E)local d=Y;
for w=1,d,1 do
    local d=i[w];
    if N<d[3]+E then
        if R>d[1]-E then
            if I<d[4]+E then
                if n>d[2]-E then
                    return true;
                end;
            end;
        end;
    end;
end;
return false;
end;
local function N()Y=0;
local I=j.drawmask();
if not(I)then
    return;
end;
local j=#I;
if j==0 then
    return;
end;
local R=b:GetGuiInset();
for b=1,j,1 do
    local j=I[b];
    if typeof(j)=="Instance"then if j.Parent then
        if j.Visible then
            local I,n=j.AbsolutePosition,j.AbsoluteSize;
            if n.X>0.5 then
                if n.Y>0.5 then
                    Y+=1;
                    b=i[Y];
                    if b then
                    else
                        b={};
                        i[Y]=b;
                    end;
                    b[1]=I.X+R.X;
                    b[2]=I.Y+R.Y;
                    b[3]=b[1]+n.X;
                    b[4]=b[2]+n.Y;
                end;
            end;
        end;
    end;
end;
end;
end;
local function j(b,I)local R,n,E,d,w=b.X,b.Y,I.X,I.Y,Y;
local P=false;
for r=1,w,1 do
    local w,L,Z,X,q,U=i[r],E-R,d-n,0,1,true;
    if L==0 then
        U=if R<w[1]then
            false
        else
            if R>w[3]then
                false
            else
                U;
            else
                local z,J=(w[1]-R)/L,(w[3]-R)/L;
                if z>J then
                    z,J=J,z;
                else
                end;
                X,q=if z>X then
                    z
                else
                    X,if J<q then
                        J
                    else
                        q;
                    end;
                    if U then
                        if Z==0 then
                            U=if n<w[2]then
                                false
                            else
                                if n>w[4]then
                                    false
                                else
                                    U;
                                else
                                    local z,J=(w[2]-n)/Z,(w[4]-n)/Z;
                                    if z>J then
                                        z,J=J,z;
                                    else
                                    end;
                                    X,q=if z>X then
                                        z
                                    else
                                        X,if J<q then
                                            J
                                        else
                                            q;
                                        end;
                                    else
                                    end;
                                    if U then
                                        if X<=q then
                                            r=(L*L+Z*Z)^0.5;
                                            if X*r<1 then
                                                if(1-q)*r<1 then
                                                    return nil;
                                                end;
                                            end;
                                            if X>=1-q then
                                                local r,U=R+L*X,n+Z*X;
                                                E,d=r,U;
                                            else
                                                local r,X=R+L*q,n+Z*q;
                                                R,n=r,X;
                                            end;
                                            w=true;
                                            P=w;
                                        else
                                        end;
                                    else
                                    end;
                                end;
                                if not(P)then
                                    return b,I;
                                end;
                                return o(R,n),o(E,d);
                            end;
                            local function b(I,R)local n,E=I.X,I.Y;
                            local d,w,P=n+R.X,E+R.Y,Y;
                            local r=false;
                            for L=1,P,1 do
                                local P=i[L];
                                if n<P[3]then
                                    if d>P[1]then
                                        if E<P[4]then
                                            if w>P[2]then
                                                local Z,X,q,U,z=0;
                                                if P[2]>E then
                                                    L=K(w,P[2]);
                                                    local J=(d-n)*(L-E);
                                                    if J>Z then
                                                        Z,X,q,U,z=J,n,E,d,L;
                                                    else
                                                    end;
                                                else
                                                end;
                                                if P[4]<w then
                                                    local L=S(E,P[4]);
                                                    local J=(d-n)*(w-L);
                                                    if J>Z then
                                                        Z,X,q,U,z=J,n,L,d,w;
                                                    else
                                                    end;
                                                else
                                                end;
                                                if P[1]>n then
                                                    local L=K(d,P[1]);
                                                    local J=(L-n)*(w-E);
                                                    if J>Z then
                                                        Z,X,q,U,z=J,n,E,L,w;
                                                    else
                                                    end;
                                                else
                                                end;
                                                if P[3]<d then
                                                    local L=S(n,P[3]);
                                                    local P=(d-L)*(w-E);
                                                    if P>Z then
                                                        Z,n=P,L;
                                                    else
                                                        n,E,d,w=X,q,U,z;
                                                    end;
                                                else
                                                    n,E,d,w=X,q,U,z;
                                                end;
                                                if Z<=1 then
                                                    return nil;
                                                end;
                                                local P=true;
                                                r=P;
                                            else
                                            end;
                                        else
                                        end;
                                    else
                                    end;
                                else
                                end;
                            end;
                            if not(r)then
                                return I,R;
                            end;
                            return o(n,E),o(d-n,w-E);
                        end;
                        local function I(R)local n,E,d=R.d,R.w,R.keys;
                        for w=1,#d,1 do
                            local P=d[w];
                            n[P]=E[P];
                        end;
                        R.hid=false;
                        n.Visible=true;
                    end;
                    local function R(n)local E,d,w=n.d,n.w,n.cls;
                    if not(d.Visible)then
                        E.Visible=false;
                        n.hid=false;
                        return;
                    end;
                    if Y==0 then
                        I(n);
                        return;
                    end;
                    if w=="Line"then local P,r=j(d.From,d.To);
                    if not(P)then
                        E.Visible=false;
                        n.hid=true;
                        return;
                    end;
                    E.From=P;
                    E.To=r;
                    n.hid=false;
                    E.Visible=true;
                    return;
                end;
                if w=="Square"then if E.Filled then
                    local j,P=b(d.Position,d.Size);
                    if not(j)then
                        E.Visible=false;
                        n.hid=true;
                        return;
                    end;
                    E.Position=j;
                    E.Size=P;
                    n.hid=false;
                    E.Visible=true;
                    return;
                end;
            end;
            local j,b,P,r;
            if w=="Text"then local L,Z=d.Position,E.TextBounds;
            j=E.Center and L.X-Z.X*0.5 or L.X;
            b=j+Z.X;
            P,r=L.Y,L.Y+Z.Y;
        else
            if w=="Circle"then local L,Z=d.Position,E.Radius;
            j,P,b,r=L.X-Z,L.Y-Z,L.X+Z,L.Y+Z;
        else
            if w=="Triangle"then local w,L,Z=d.PointA,d.PointB,d.PointC;
            j,b,P=K(w.X,L.X,Z.X),S(w.X,L.X,Z.X),K(w.Y,L.Y,Z.Y);
            r=S(w.Y,L.Y,Z.Y);
        else
            local K,S=d.Position,d.Size;
            j,P,b,r=K.X,K.Y,K.X+S.X,K.Y+S.Y;
        end;
    end;
end;
if B(j,P,b,r,n.hid and 6 or 0)then
    E.Visible=false;
    n.hid=true;
    return;
end;
I(n);
end;
local function j(b)local K=M[b];
if not(K)then
    return;
end;
local S=T[x];
local I=M[S];
T[K.i]=S;
if I then
    I.i=K.i;
end;
T[x]=nil;
x-=1;
if K.mi>0 then
    S=p[A];
    I=M[S];
    p[K.mi]=S;
    if I then
        I.mi=K.mi;
    end;
    p[A]=nil;
    A-=1;
end;
M[b]=nil;
end;
local function b(K)local S=M[K];
if not(S)then
    return;
end;
j(K);
pcall(S.d.Remove,S.d);
end;
local K={__index=function(S,I)local n=M[S];
if not(n)then
    return nil;
end;
if I=="Remove"then return b;
elseif  I=="Destroy"then return b;
end;
if n.tr[I]then
    return n.w[I];
end;
return n.d[I];
end,__newindex=function(b,S,I)local n=M[b];
if not(n)then
    return;
end;
if not(n.tr[S])then
    b=n.u;
    if b[S]~=I then
        b[S]=I;
        n.d[S]=I;
    end;
    return;
end;
b=n.w[S];
if b~=I then
    n.w[S]=I;
    if Y==0 then
        n.d[S]=I;
    elseif  n.mi==0 then
        n.d[S]=I;
    else
        R(n);
    end;
end;
end
};
local function b(S,I)return S[I];
end;
a.new=function(S,I)local n,E,d,w=Drawing.new(S),G[S]or G.Square,t[S]or t.Square,{};
for t in E,nil,nil do
    local G,P=pcall(b,n,t);
    if G then
        w[t]=P;
    end;
end;
if w.Visible==nil then
    w.Visible=false;
end;
for b=1,#d,1 do
    local t=d[b];
    if w[t]==nil then
        w[t]=o();
    end;
end;
local b=setmetatable({},K);
x+=1;
T[x]=b;
local K={d=n,cls=S,tr=E,keys=d,w=w,u={},hid=false,i=x,mi=0};
M[b]=K;
if I then
    A+=1;
    p[A]=b;
    K.mi=A;
end;
return b;
end;
a.mask_step=function()if not(pcall(N))then
    Y=0;
end;
local b=A>0 and(Y>0 or O>0);
if b then
    local b=A;
    for K=b,1,-1 do
        local b=p[K];
        K=M[b];
        if K then
            if not(pcall(R,K))then
                j(b);
            end;
        end;
    end;
end;
O=Y;
end;
a.count=function()local j=x;
return j;
end;
a.mask_active=function()local j=Y;
return j>0;
end;
a.mask_test=function(j,b,K,S)if Y==0 then
    return false;
end;
return B(j,b,K,S,0);
end;
a.purge=function()local j=x;
for b=j,1,-1 do
    local K=T[b];
    if K then
        local S=M[K];
        if S then
            pcall(S.d.Remove,S.d);
            M[K]=nil;
        end;
    end;
    T[b]=nil;
end;
j=A;
for b=j,1,-1 do
    p[b]=nil;
end;
x,A,Y,O=0,0,0,0;
table.clear(M);
table.clear(i);
end;
h.teardown(a.purge);
return a;
end;

D.u=function()
local fonts=Drawing and Drawing.Fonts
local face=type(fonts)=="table" and (fonts.Monospace or fonts.UI) or 3
return {numeric=face,face=function()return face end,
bounds=function(size,text)return #text*size*0.6,size end,
advance=function(size)return size*0.6 end}
end;

D.v=function()local j=D.load("a");
local h=D.load("t");
local b,K,S=D.load("u"),{},1;
K.scale=function(o)S=o or 1;
end;
K.k=function()local o=S;
return o;
end;
local o=type(DrawingImmediate)=="table"and type(DrawingImmediate.GetPaint)=="function"and type(DrawingImmediate.FilledRectangle)=="function";
K.immediate=o;
if o then
    local o=DrawingImmediate.Line;
    local t=DrawingImmediate.Rectangle;
    local G=DrawingImmediate.FilledRectangle;
    local i=DrawingImmediate.Triangle;
    local Y=DrawingImmediate.FilledTriangle;
    local O=DrawingImmediate.Quad;
    local T=DrawingImmediate.FilledQuad;
    local x=DrawingImmediate.Circle;
    local p=DrawingImmediate.FilledCircle;
    local A=DrawingImmediate.Text;
    local M=DrawingImmediate.OutlinedText;
    K.line=function(a,B,N,I,R)o(a,B,N,I*S,R);
end;
K.rect=function(o,a,B,N,I,R)t(o,a,B,N*S,R or 0,I);
end;
K.filled_rect=function(o,t,a,B,N)G(o,t,a,B*S,N or 0);
end;
K.tri=function(o,t,G,a,B,N)i(o,t,G,a,B*S,N);
end;
K.filled_tri=function(o,t,G,i,a)Y(o,t,G,i,a*S);
end;
K.quad=function(o,t,G,i,Y,a,B)O(o,t,G,i,Y,a*S,B);
end;
K.filled_quad=function(o,t,G,i,Y,O)T(o,t,G,i,Y,O*S);
end;
K.circle=function(o,t,G,i,Y,O)x(o,t,G,i*S,Y or 24,O);
end;
K.filled_circle=function(o,t,G,i,Y)p(o,t,G,i*S,Y or 24);
end;
K.text=function(o,t,G,i,Y,O)A(o,b.face(t),t,G,i*S,Y,O);
end;
K.outlined_text=function(o,t,G,i,Y,O,T,x)M(o,b.face(t),t,G,i*S,Y,O*S,T,x);
end;
local o;
K.run=function(t)if o then
    return;
end;
local G=DrawingImmediate.GetPaint(0);
o=G:Connect(t);
j.adopt(o);
end;
K.pump=function()end;
return K;
end;
local o,t,G,i={Line={},Square={},Triangle={},Circle={},Text={}},{Line=0,Square=0,Triangle=0,Circle=0,Text=0},{Line=0,Square=0,Triangle=0,Circle=0,Text=0},0;
local function Y(O)local T=G[O]+1;
G[O]=T;
local x=o[O];
local p=x[T];
if p then
else
    p=h.new(O,true);
    x[T]=p;
    if T>t[O]then
        t[O]=T;
    end;
end;
i+=1;
p.ZIndex=i;
return p;
end;
K.line=function(h,O,T,x,p)local A=Y("Line");
A.From=h;
A.To=O;
A.Color=T;
A.Transparency=x*S;
A.Thickness=p;
A.Visible=true;
end;
K.rect=function(h,O,T,x,p)local A=Y("Square");
A.Position=h;
A.Size=O;
A.Color=T;
A.Transparency=x*S;
A.Thickness=p;
A.Filled=false;
A.Visible=true;
end;
K.filled_rect=function(h,O,T,x)local p=Y("Square");
p.Position=h;
p.Size=O;
p.Color=T;
p.Transparency=x*S;
p.Thickness=1;
p.Filled=true;
p.Visible=true;
end;
K.tri=function(h,O,T,x,p,A)local M=Y("Triangle");
M.PointA=h;
M.PointB=O;
M.PointC=T;
M.Color=x;
M.Transparency=p*S;
M.Thickness=A;
M.Filled=false;
M.Visible=true;
end;
K.filled_tri=function(h,O,T,x,p)local A=Y("Triangle");
A.PointA=h;
A.PointB=O;
A.PointC=T;
A.Color=x;
A.Transparency=p*S;
A.Filled=true;
A.Visible=true;
end;
K.quad=function(h,O,T,x,p,A,M)K.line(h,O,p,A,M);
K.line(O,T,p,A,M);
K.line(T,x,p,A,M);
K.line(x,h,p,A,M);
end;
K.filled_quad=function(h,O,T,x,p,A)K.filled_tri(h,O,T,p,A);
K.filled_tri(h,T,x,p,A);
end;
K.circle=function(h,O,T,x,p,A)local M=Y("Circle");
M.Position=h;
M.Radius=O;
M.Color=T;
M.Transparency=x*S;
M.NumSides=p or 24;
M.Thickness=A;
M.Filled=false;
M.Visible=true;
end;
K.filled_circle=function(h,O,T,x,p)local A=Y("Circle");
A.Position=h;
A.Radius=O;
A.Color=T;
A.Transparency=x*S;
A.NumSides=p or 24;
A.Filled=true;
A.Visible=true;
end;
K.text=function(h,O,T,x,p,A)local M=Y("Text");
M.Font=b.face(O);
M.Size=O;
M.Text=p;
M.Position=h;
M.Color=T;
M.Transparency=x*S;
M.Center=A;
M.Outline=false;
M.Visible=true;
end;
K.outlined_text=function(h,O,T,x,p,A,M,a)A=Y("Text");
A.Font=b.face(O);
A.Size=O;
A.Text=M;
A.Position=h;
A.Color=T;
A.Transparency=x*S;
A.Center=a;
A.Outline=true;
A.OutlineColor=p;
A.Visible=true;
end;
local function h(b)local Y=o[b];
for O=G[b]+1,t[b],1 do
    local T=Y[O];
    if T then
        T.Visible=false;
    end;
end;
G[b]=0;
end;
local function b()h("Line");
h("Square");
h("Triangle");
h("Circle");
h("Text");
i=0;
end;
local h;
K.run=function(Y)h=Y;
end;
K.pump=function()if not(h)then
    return;
end;
pcall(h);
b();
end;
j.teardown(function()for j,h in o,nil,nil do
    for b=t[j],1,-1 do
        h[b]=nil;
    end;
    t[j]=0;
    G[j]=0;
end;
i,S=0,1;
end);
return K;
end;

D.w=function()local j,h=D.load("a"),D.load("s");
local b,K,S,o,t=h.av_gui,{},{},0,0;
local function G()local i=Instance.new("ImageLabel");
i.AnchorPoint=Vector2.new(0.5,0.5);
i.BackgroundTransparency=1;
i.BorderSizePixel=0;
i.ScaleType=Enum.ScaleType.Fit;
i.Image=h.arrow();
i.Visible=false;
i.ZIndex=40;
i.Parent=b;
return{image=i,shown=false};
end;
local h,i,Y={},0,0;
K.open=function()t,Y=0,0;
end;
local function O()local T=Instance.new("ImageLabel");
T.AnchorPoint=Vector2.new(0.5,0.5);
T.BackgroundTransparency=1;
T.BorderSizePixel=0;
T.ScaleType=Enum.ScaleType.Fit;
T.Visible=false;
T.ZIndex=42;
T.Parent=b;
return{image=T,shown=false};
end;
K.icon=function(T,x,p,A,M,a)Y+=1;
local B=h[Y];
if B then
else
    B=O();
    i+=1;
    h[i]=B;
end;
local O=B.image;
if B.asset~=A then
    B.asset=A;
    O.Image=A;
end;
if B.x~=T or B.y~=x then
    B.x=T;
    B.y=x;
    O.Position=UDim2.fromOffset(T,x);
end;
if B.size~=p then
    B.size=p;
    O.Size=UDim2.fromOffset(p,p);
end;
if B.col~=M then
    B.col=M;
    O.ImageColor3=M;
end;
T=1-(a or 1);
if B.alpha~=T then
    B.alpha=T;
    O.ImageTransparency=T;
end;
if not(B.shown)then
    B.shown=true;
    O.Visible=true;
end;
end;
K.put=function(O,T,x,p,A,M)t+=1;
local a=S[t];
if a then
else
    a=G();
    o+=1;
    S[o]=a;
end;
local G=a.image;
if a.x~=O or a.y~=T then
    a.x=O;
    a.y=T;
    G.Position=UDim2.fromOffset(O,T);
end;
if a.size~=x then
    a.size=x;
    G.Size=UDim2.fromOffset(x,x);
end;
if a.rotation~=p then
    a.rotation=p;
    G.Rotation=p;
end;
if a.col~=A then
    a.col=A;
    G.ImageColor3=A;
end;
O=1-(M or 1);
if a.alpha~=O then
    a.alpha=O;
    G.ImageTransparency=O;
end;
if not(a.shown)then
    a.shown=true;
    G.Visible=true;
end;
end;
local G,O,T={},0,0;
local function x()local p=Instance.new("ImageLabel");
p.AnchorPoint=Vector2.new(0.5,0.5);
p.BackgroundTransparency=1;
p.BorderSizePixel=0;
p.ScaleType=Enum.ScaleType.Fit;
p.Visible=false;
p.ZIndex=41;
p.Parent=b;
return{image=p,shown=false};
end;
K.avatar=function(b,p,A,M)T+=1;
local a=G[T];
if a then
else
    a=x();
    O+=1;
    G[O]=a;
end;
local x=a.image;
if a.uid~=M then
    a.uid=M;
    x.Image="rbxthumb://type=AvatarHeadShot&id="..tostring(M).."&w=48&h=48";
end;
if a.x~=b or a.y~=p then
    a.x=b;
    a.y=p;
    x.Position=UDim2.fromOffset(b,p);
end;
if a.size~=A then
    a.size=A;
    x.Size=UDim2.fromOffset(A,A);
end;
if not(a.shown)then
    a.shown=true;
    x.Visible=true;
end;
end;
K.close=function()local b,x=t+1,o;
for p=b,x,1 do
    local A=S[p];
    if A then
        if A.shown then
            A.shown=false;
            A.image.Visible=false;
        end;
    end;
end;
x,b=T+1,O;
for p=x,b,1 do
    local A=G[p];
    if A then
        if A.shown then
            A.shown=false;
            A.image.Visible=false;
        end;
    end;
end;
x,b=Y+1,i;
for p=x,b,1 do
    local b=h[p];
    if b then
        if b.shown then
            b.shown=false;
            b.image.Visible=false;
        end;
    end;
end;
T=0;
end;
K.purge=function()local b=o;
for x=b,1,-1 do
    local p=S[x];
    S[x]=nil;
    if p then
        pcall(p.image.Destroy,p.image);
    end;
end;
b=O;
for S=b,1,-1 do
    local x=G[S];
    G[S]=nil;
    if x then
        pcall(x.image.Destroy,x.image);
    end;
end;
b=i;
for S=b,1,-1 do
    local b=h[S];
    h[S]=nil;
    if b then
        pcall(b.image.Destroy,b.image);
    end;
end;
o,t,O,T,i,Y=0,0,0,0,0,0;
end;
j.teardown(K.purge);
return K;
end;

D.x=function()local j,h=D.load("b"),D.load("s");
local b=j.lp;
local K=table.find;
local S=os.clock;
local o=Color3.new().Lerp;
local t,G=math.sin,{};
local i=j.weak();
local Y=j.weak();
G.char_info=function(O)local T=Y[O];
if T then
else
    T={};
    Y[O]=T;
end;
return T;
end;
G.shared_for=function(Y,O)local T=i[O];
if T then
else
    T={};
    i[O]=T;
end;
local i=h.frame();
if T.frame~=i then
    T.frame=i;
    T.vis=false;
    local i=Y.isFr(O);
    T.fr=i;
    local x=Y.tSet[i and"fr"or"en"];
    T.opt=x;
    T.clone=Y._clones[O];
    i=x.en;
    if(if i then
        O==b and not Y.allowlocal
    else
        not i)or O.UserId~=nil and#Y.wlist>0 and not K(Y.wlist,O.UserId)then
            T.en=false;
            T.char=nil;
        else
            x=Y.getChar(O);
            T.char=x;
            T.en=x~=nil;
        end;
    end;
    return T;
end;
local b=j.weak();
G.opt_flags=function(j,K)j=b[K];
if j then
else
    j={};
    b[K]=j;
end;
local b=h.frame();
if j.frame~=b then
    j.frame=b;
    local b,i,Y=(K.hb or K.ht)and true or false,(K.ab or K.at)and true or false,(K.bomb or K.scope or K.flashed or K.defuse)and true or false;
    j.hp=b;
    j.arm=i;
    j.wep=(K.wep or K.wepIcon)and true or false;
    j.mon=K.mon and true or false;
    j.pn=K.pn and true or false;
    j.ind=Y;
    j.corn=(b or i or Y or K.box or K.name or K.av or K.dis or K.wep or K.wepIcon or K.mon or K.pn or K.tr or K.b3d)and true or false;
end;
return j;
end;
G.grad=function(j,b,K,i)return o(j,b,t(K*3.1416+S()*2+(i or 0)*6.283)*0.5+0.5);
end;
G.box_col=function(j,b,K,S,t,i)return j and o(b,K,(S-t)/i)or b;
end;
G.find_part=function(j,b)local K=j:FindFirstChild(b);
if K then
    if K.Parent==j then
        if K:IsA("BasePart")then
            return K;
        end;
    end;
end;
return nil;
end;
G.draw_line=function(j,b,K,S,o,t)if o then
    if t then
        local i,Y=K(o);
        local o,O=K(t);
        if Y then
            if O then
                S.From=i;
                S.To=o;
                S.Visible=true;
                S.Color=h.parse_col(j,b.skelCol[1]);
                S.Transparency=b.skelCol[2];
                return true;
            end;
        end;
    end;
end;
S.Visible=false;
return false;
end;
return G;
end;

D.y=function()local j,h,b=D.load("b"),{},{};
local K=j.storage:FindFirstChild("Database");
j=K and(K:FindFirstChild("Custom"));
K=j and(j:FindFirstChild("Weapons"));
if K then
    j=K:GetChildren();
    for K=1,#j,1 do
        local S=j[K];
        if S:IsA("ModuleScript")then
            local j,o=pcall(require,S);
            if j then
                if type(o)=="table"then K=o.Icon;
                if type(K)=="string"then if K~=""then h[S.Name]=K;
            end;
        end;
    end;
end;
end;
end;
end;
b.map=h;
b.of=function(j)if type(j)~="string"then return nil;
elseif  j==""then return nil;
end;
return h[j];
end;
return b;
end;

D.z=function()local j=D.load("s");
local h=D.load("x");
local b=D.load("v");
local K=D.load("u");
local S=D.load("w");
local o=D.load("y");
local t=math.floor;
local G=math.round;
local i=math.min;
local Y=math.clamp;
local O=Color3.new().Lerp;
local T=Vector2.zero.Lerp;
local x=string.sub;
local p=Vector2.new;
local A=j.hb_off;
local M=j.ht_off;
local a=j.ho_off;
local B=j.bb_off;
local N=j.bo_off;
local I=j.bt_off;
local R=j.n_off;
local n,E,d=Color3.new(),{bx=0,by=0,lx=0,ly=0,rx=0,ry=0,sb=0,sl=0,sr=0},{bone=function(w,P,r,L,Z)if L then
    if not(Z)then
        return;
    end;
else
    return;
end;
local X,q=w:project(L);
local L,U=w:project(Z);
if q then
    if U then
        b.line(X,L,P,r,1);
    end;
end;
end
};
local function w(P,r,L)L=L or 0;
if r=="right"then local Z=L*7;
local X=p(A.X+Z,0);
return P.tr+X,P.br+X,a,p(M.X+Z,0),"v";
elseif  r=="bottom"then local Z=L*22;
local X=p(0,B.Y+Z);
return P.bl+X,P.br+X,N,p(0,I.Y+Z),"h";
end;
r=L*7;
local N=p(A.X+r,0);
return P.tl-N,P.bl-N,a,p(M.X+r,0),"v";
end;
d.bar_geom=w;
local function a(N,I,P,r,L,Z)for X=1,10,1 do
    local q,U=(X-1)/10,X/10;
    b.line(T(N,I,q),T(N,I,U),O(P,r,(q+U)*0.5),L,Z);
end;
end;
local function N(I,P,r,L,Z,X,q,U,z)local J=#I;
if J==0 then
    return 0;
end;
local y=K.bounds(L,I);
local f=P-y*0.5;
for k=1,J,1 do
    local g,Q=x(I,k,k),J>1 and(k-1)/(J-1)or 0;
    P=h.grad(q,U,Q,z);
    if Z then
        b.outlined_text(p(f,r),L,P,X,Z,X,g,false);
    else
        b.text(p(f,r),L,P,X,g,false);
    end;
    f+=K.bounds(L,g);
end;
return y;
end;
d.grad_text=N;
d.place=function(x,I,P,r,L,Z,X,q,U,z)local J,y=K.bounds(r,I);
local f,k;
if P=="left"then f,k=E.lx-J*0.5,E.ly+E.sl+y*0.5;
E.sl=E.sl+(y+2);
else
    if P=="right"then f,k=E.rx+J*0.5,E.ry+E.sr+y*0.5;
    E.sr=E.sr+(y+2);
else
    f,k=E.bx,E.by+E.sb+y*0.5;
    E.sb=E.sb+(y+2);
end;
end;
if q then
    N(I,f,k-y*0.5,r,X,Z,U,z,x.ph);
elseif  X then
    b.outlined_text(p(f,k),r,L,Z,X,Z,I,true);
else
    b.text(p(f,k),r,L,Z,I,true);
end;
end;
d.place_icon=function(x,x,I,P,r,L)local Z,X;
if I=="left"then Z,X=E.lx-P*0.5,E.ly+E.sl+P*0.5;
E.sl=E.sl+(P+2);
else
    if I=="right"then Z,X=E.rx+P*0.5,E.ry+E.sr+P*0.5;
    E.sr=E.sr+(P+2);
else
    Z,X=E.bx,E.by+E.sb+P*0.5;
    E.sb=E.sb+(P+2);
end;
end;
S.icon(t(Z),t(X),P,x,r,(L or 1)*b.k());
end;
local function x(I,P,r,L,Z,X,q,U,z)local J,y=P.tl,P.br;
local f,k,g,Q=J.X,J.Y,y.X-1,y.Y-1;
I,J=g-f+1,Q-k+1;
if I<=0 then
    return;
elseif  J<=0 then
    return;
end;
P,y=t(I*0.25),t(J*0.25);
P,y=if P<1 then
    1
else
    P,if y<1 then
        1
    else
        y;
        I=Q-k;
        I=if I<=0 then
            1
        else
            I;
            if U then
                b.filled_rect(p(f-1,k-1),p(P+2,3),q,z);
                b.filled_rect(p(g-P,k-1),p(P+2,3),q,z);
                b.filled_rect(p(f-1,Q-1),p(P+2,3),q,z);
                b.filled_rect(p(g-P,Q-1),p(P+2,3),q,z);
                b.filled_rect(p(f-1,k-1),p(3,y+2),q,z);
                b.filled_rect(p(g-1,k-1),p(3,y+2),q,z);
                b.filled_rect(p(f-1,Q-y),p(3,y+2),q,z);
                b.filled_rect(p(g-1,Q-y),p(3,y+2),q,z);
            end;
            z,J=h.box_col(Z,r,L,k,k,I),h.box_col(Z,r,L,Q,k,I);
            b.filled_rect(p(f,k),p(P,1),z,X);
            b.filled_rect(p(g-P+1,k),p(P,1),z,X);
            b.filled_rect(p(f,Q),p(P,1),J,X);
            b.filled_rect(p(g-P+1,Q),p(P,1),J,X);
            P=Z and i(6,y)or 1;
            for c=1,P,1 do
                U,J=t(y*(c-1)/P),t(y*c/P);
                J=if J<=U then
                    U+1
                else
                    J;
                    local P,y,c,H=k+U,k+J,Q-J+1,Q-U+1;
                    z,q=h.box_col(Z,r,L,(P+y)*0.5,k,I),h.box_col(Z,r,L,(c+H)*0.5,k,I);
                    b.filled_rect(p(f,P),p(1,y-P),z,X);
                    b.filled_rect(p(g,P),p(1,y-P),z,X);
                    b.filled_rect(p(f,c),p(1,H-c),q,X);
                    b.filled_rect(p(g,c),p(1,H-c),q,X);
                end;
            end;
            local function h(I,P,r,L,Z)local X,q=P.tl,P.br;
            local U,z,J,y=X.X,X.Y,q.X-1,q.Y-1;
            P,X=J-U+1,y-z+1;
            if P<=0 then
                return;
            elseif  X<=0 then
                return;
            end;
            b.filled_rect(p(U,z),p(P,1),r,Z);
            b.filled_rect(p(U,y),p(P,1),L,Z);
            q=i(24,X);
            for y=1,q,1 do
                I,P=t(X*(y-1)/q),t(X*y/q);
                P=if P<=I then
                    I+1
                else
                    P;
                    local q,y,f=z+I,z+P,O(r,L,(I+P)*0.5/X);
                    b.filled_rect(p(U,q),p(1,y-q),f,Z);
                    b.filled_rect(p(J,q),p(1,y-q),f,Z);
                end;
            end;
            local function I(P,r,L,Z,X)local q=r.Y;
            if q<=0 then
                return;
            elseif  r.X<=0 then
                return;
            end;
            local U,z,J=i(24,q),P.tl.X,P.tl.Y;
            for y=1,U,1 do
                local f,k=t(q*(y-1)/U),t(q*y/U);
                k=if k<=f then
                    f+1
                else
                    k;
                    P=O(L,Z,(f+k)*0.5/q);
                    b.filled_rect(p(z,J+f),p(r.X,k-f),P,X);
                end;
            end;
            d.draw=function(P)if not(P.en)then
                return;
            end;
            if P._quiet then
                return;
            end;
            local r,L,Z,X=P.itf,P.opt,P.corn,P.onSc or false;
            local q,U=r.shSet.tSz,r._clones[P.plr];
            if not(X)then
                if L.offAr then
                    if P.dir then
                        if not(U)then
                            local z,J=j.viewport(),L.offArPad or 18;
                            local y,f=z*0.5,P.dir;
                            local z,k,g=y+f*i((y.X-J)/math.max(math.abs(f.X),1.0E-4),(y.Y-J)/math.max(math.abs(f.Y),1.0E-4)),L.offArCol,math.deg(math.atan2(f.Y,f.X))+90;
                            S.put(t(z.X),t(z.Y),L.offArSz or 22,g,k[1],(k[2]or 1)*b.k());
                        end;
                    end;
                end;
                return;
            end;
            if not(Z)then
                return;
            end;
            local i,z,J,y,f=Z.br-Z.tl,L.box,L.boxType=="Corners",L.boxGrd,j.parse_col(P,L.boxOCol[1],true);
            if z then
                if L.boxF then
                    if L.boxFGrd then
                        I(Z,i,L.boxFGrdCol[1],L.boxFGrdCol[2],L.boxFCol[2]);
                    else
                        b.filled_rect(Z.tl,i,j.parse_col(P,L.boxFCol[1]),L.boxFCol[2]);
                    end;
                end;
            end;
            if z then
                if J then
                    x(P,Z,y and L.boxGrdCol[1]or j.parse_col(P,L.boxCol[1]),L.boxGrdCol[2],y,L.boxCol[2],f,L.boxO,L.boxOCol[2]);
                elseif  y then
                    if L.boxO then
                        b.rect(Z.tl,i,f,L.boxOCol[2],3);
                    end;
                    h(P,Z,L.boxGrdCol[1],L.boxGrdCol[2],L.boxCol[2]);
                else
                    if L.boxO then
                        b.rect(Z.tl,i,f,L.boxOCol[2],3);
                    end;
                    b.rect(Z.tl,i,j.parse_col(P,L.boxCol[1]),L.boxCol[2],1);
                end;
            end;
            r,f,X,U,y=L.hbSide or"left",L.abSide or"right",L.hb,L.ab,0;
            local h,x,I,k,g=if X then
                if U then
                    if r==f then
                        1
                    else
                        0
                    else
                        0
                    else
                        0,0,0,0,0;
                        if X then
                            local Q,c,H,_,s=w(Z,r,y);
                            i=P.maxHp>0 and P.hp/P.maxHp or 0;
                            J=T(c,Q,i);
                            if L.hbo then
                                b.line(Q-H,c+H,j.parse_col(P,L.hboCol[1],true),L.hboCol[2],3);
                            end;
                            if L.hbGrd then
                                a(J,c,L.hbGrdCol[1],L.hbGrdCol[2],1,1);
                            elseif  L.hbCol and L.hbCol[1]then
                                b.line(J,c,j.parse_col(P,L.hbCol[1]),L.hbCol[2]or 1,1);
                            else
                                b.line(J,c,O(L.dyCol,L.hlCol,i),1,1);
                            end;
                            if L.ht then
                                z=G(P.hp).."hp";
                                local O,F=K.bounds(q,z);
                                H=T(c,Q,i);
                                local Q,c;
                                if s=="h"then Q,c=H.X-O*0.5,H.Y+_.Y;
                            else
                                if r=="right"then Q,c=H.X+_.X,H.Y-F*0.5;
                            else
                                Q,c=H.X-_.X-O,H.Y-F*0.5;
                            end;
                        end;
                        local H=L.htOut and j.parse_col(P,L.htOCol,true)or nil;
                        if L.htGrd then
                            N(z,Q+O*0.5,c,q,H,L.htCol[2],L.htGrdCol[1],L.htGrdCol[2],P.ph);
                        elseif  H then
                            b.outlined_text(p(Q,c),q,j.parse_col(P,L.htCol[1]),L.htCol[2],H,L.htCol[2],z,false);
                        else
                            b.text(p(Q,c),q,j.parse_col(P,L.htCol[1]),L.htCol[2],z,false);
                        end;
                        x,I=O,F;
                    else
                    end;
                else
                end;
                if U then
                    local O,Q,c,H,_=w(Z,f,h);
                    y=L.armMax or 100;
                    J=Y(P.arm/y,0,1);
                    z=T(Q,O,J);
                    if L.abo then
                        b.line(O-c,Q+c,j.parse_col(P,L.aboCol[1],true),L.aboCol[2],3);
                    end;
                    if L.abGrd then
                        a(z,Q,L.abGrdCol[1],L.abGrdCol[2],1,1);
                    else
                        b.line(z,Q,j.parse_col(P,L.abCol[1]),L.abCol[2]or 1,1);
                    end;
                    if L.at then
                        c=G(P.arm).."ap";
                        local Y,a=K.bounds(q,c);
                        i=T(Q,O,J);
                        local O,T;
                        if _=="h"then O,T=i.X-Y*0.5,i.Y+H.Y;
                    else
                        if f=="left"then O,T=i.X-H.X-Y,i.Y-a*0.5;
                    else
                        O,T=i.X+H.X,i.Y-a*0.5;
                    end;
                end;
                local w=L.atOut and j.parse_col(P,L.atOCol,true)or nil;
                if w then
                    b.outlined_text(p(O,T),q,j.parse_col(P,L.atCol[1]),L.atCol[2],w,L.atCol[2],c,false);
                else
                    b.text(p(O,T),q,j.parse_col(P,L.atCol[1]),L.atCol[2],c,false);
                end;
                k,g=Y,a;
            else
            end;
        else
        end;
        J,y=0,0;
        if L.name then
            z=P.plr.DisplayName;
            local Y,O=K.bounds(q,z);
            local K,T,a=(Z.tl.X+Z.tr.X)*0.5,(Z.tl.Y+Z.tr.Y)*0.5-O-R.Y,L.nOut and j.parse_col(P,L.nOCol,true)or nil;
            if L.nGrd then
                N(z,K,T,q,a,L.nCol[2],L.nGrdCol[1],L.nGrdCol[2],P.ph);
            elseif  a then
                b.outlined_text(p(K,T),q,j.parse_col(P,L.nCol[1]),L.nCol[2],a,L.nCol[2],z,true);
            else
                b.text(p(K,T),q,j.parse_col(P,L.nCol[1]),L.nCol[2],z,true);
            end;
            J,y=Y,O;
        else
        end;
        if L.av then
            local b,K,Y,O,T=q+6,(Z.tl.X+Z.tr.X)*0.5,(Z.tl.Y+Z.tr.Y)*0.5;
            if L.name and J>0 then
                O,T=K+J*0.5+b*0.5+4,Y-y*0.5-R.Y;
            else
                O,T=K,Y-b*0.5-R.Y;
            end;
            Y=P.plr;
            S.avatar(t(O),t(T),b,type(Y)=="table"and Y.avatar or Y.UserId);
        end;
        i,y,z=6,6,0;
        if X then
            if r=="left"then i+=A.X+3+0;
            i=if L.ht then
                i+(M.X+math.max(x,24))
            else
                i;
            else
                if r=="right"then y+=A.X+3+0;
                y=if L.ht then
                    y+(M.X+math.max(x,24))
                else
                    y;
                else
                    J=B.Y+4+0;
                    J=if L.ht then
                        J+I
                    else
                        J;
                        z=if J>z then
                            J
                        else
                            z;
                        end;
                    end;
                else
                end;
                if U then
                    if f=="left"then i+=A.X+3+h*7;
                    i=if L.at then
                        i+(M.X+math.max(k,24))
                    else
                        i;
                    else
                        if f=="right"then y+=A.X+3+h*7;
                        y=if L.at then
                            y+(M.X+math.max(k,24))
                        else
                            y;
                        else
                            J=B.Y+4+h*22;
                            J=if L.at then
                                J+g
                            else
                                J;
                                z=if J>z then
                                    J
                                else
                                    z;
                                end;
                            end;
                        else
                        end;
                        E.bx=(Z.bl.X+Z.br.X)*0.5;
                        E.by=(Z.bl.Y+Z.br.Y)*0.5+j.d_off.Y+z;
                        E.lx=Z.tl.X-i;
                        E.rx=Z.tr.X+y;
                        E.ly=Z.tl.Y;
                        E.ry=Z.tr.Y;
                        E.sb=0;
                        E.sl=0;
                        E.sr=0;
                        U,f,X=P.indicators,P.fr or false,d.place;
                        if U then
                            if L.bomb then
                                if not f then
                                    if U.bomb==true then
                                        X(P,"bomb",L.bombPos or"right",q,j.parse_col(P,L.bombCol[1]),L.bombCol[2],n,L.bombGrd,L.bombGrdCol[1],L.bombGrdCol[2]);
                                    end;
                                end;
                            end;
                            if L.scope then
                                if not f then
                                    if U.scope==true then
                                        X(P,"scope",L.scopePos or"right",q,j.parse_col(P,L.scopeCol[1]),L.scopeCol[2],n,L.scopeGrd,L.scopeGrdCol[1],L.scopeGrdCol[2]);
                                    end;
                                end;
                            end;
                            if L.flashed then
                                if U.flashed==true then
                                    X(P,"flashed",L.flashedPos or"right",q,j.parse_col(P,L.flashedCol[1]),L.flashedCol[2],n,L.flashedGrd,L.flashedGrdCol[1],L.flashedGrdCol[2]);
                                end;
                            end;
                            if L.defuse then
                                if not f then
                                    if U.defuse==true then
                                        X(P,"defuse",L.defusePos or"right",q,j.parse_col(P,L.defuseCol[1]),L.defuseCol[2],n,L.defuseGrd,L.defuseGrdCol[1],L.defuseGrdCol[2]);
                                    end;
                                end;
                            end;
                        end;
                        if L.dis then
                            X(P,G(P.dis).." studs",L.dPos or"bottom",q,j.parse_col(P,L.dCol[1]),L.dCol[2],L.dOut and j.parse_col(P,L.dOCol,true)or nil,L.dGrd,L.dGrdCol[1],L.dGrdCol[2]);
                        end;
                        if L.wep then
                            Z=P.wep;
                            if type(Z)=="string"then if Z~=""then X(P,Z,L.wPos or"bottom",q,j.parse_col(P,L.wCol[1]),L.wCol[2],L.wOut and j.parse_col(P,L.wOCol,true)or nil,L.wGrd,L.wGrdCol[1],L.wGrdCol[2]);
                        end;
                    end;
                end;
                if L.wepIcon then
                    J=o.of(P.wep);
                    if J then
                        U=L.wepIconCol;
                        d.place_icon(P,J,L.wepIconPos or"bottom",L.wepIconSz or 16,j.parse_col(P,U[1]),U[2]);
                    end;
                end;
                if L.mon then
                    X(P,"$"..t(P.mon),L.monPos or"right",q,j.parse_col(P,L.monCol[1]),L.monCol[2],n,L.monGrd,L.monGrdCol[1],L.monGrdCol[2]);
                end;
                if L.pn then
                    X(P,t(P.pn).."ms",L.pnPos or"right",q,j.parse_col(P,L.pnCol[1]),L.pnCol[2],n,L.pnGrd,L.pnGrdCol[1],L.pnGrdCol[2]);
                end;
                if L.skel then
                    if P.skpts then
                        q,f,J,X=P.skpts,j.parse_col(P,L.skelCol[1]),L.skelCol[2],d.bone;
                        X(P,f,J,q.hd,q.ur);
                        X(P,f,J,q.ur,q.lr);
                        X(P,f,J,q.ur,q.lua);
                        X(P,f,J,q.lua,q.lfa);
                        X(P,f,J,q.ur,q.rua);
                        X(P,f,J,q.rua,q.rfa);
                        X(P,f,J,q.lr,q.lul);
                        X(P,f,J,q.lul,q.lll);
                        X(P,f,J,q.lr,q.rul);
                        X(P,f,J,q.rul,q.rll);
                    end;
                end;
            end;
            return d;
        end;

D.B=function()local j=D.load("b");
local h=D.load("a");
local b=D.load("s");
local K=D.load("x");
local S=D.load("p");
local o=j.workspace;
local t=j.lp;
local G=b.white;
local i=math.min;
local Y=math.max;
local O,T,x=Vector3.new,{["Counter-Terrorists"]=true,CT=true},{};
x.UpperTorso=O(1,1.04,1);
x.LowerTorso=O(0.95,1.5,1);
x.Torso=O(1,1,1);
local p=Enum.AdornShading and Enum.AdornShading.XRay or nil;
local A=Enum.AdornCullingMode and Enum.AdornCullingMode.Never or nil;
if type(setfflag)=="function"then pcall(setfflag,"AdornShadingAPI","True");
end;
local M,a;
local function B()local N=o.CurrentCamera;
if not(N)then
    return nil;
end;
if if M then
    not M.Parent
else
    not M then
        M=Instance.new("Folder");
        M.Parent=N;
        h.own(M);
        a=Instance.new("Part");
        local h=a;
        h.Size=Vector3.one;
        a.Anchored=true;
        a.CanCollide=false;
        a.CanQuery=false;
        a.CanTouch=false;
        a.CastShadow=false;
        a.Massless=true;
        a.Locked=true;
        a.Transparency=1;
        a.Parent=M;
    elseif  M.Parent~=N then
        M.Parent=N;
    end;
    N=M;
    return N;
end;
local h=Vector3.one*0.004;
local N=CFrame.new();
local I,R,n,E=Vector3.zero,false,0,{};
E.__index=E;
E.begin_frame=function(d)local w=o.CurrentCamera;
if not(w)then
    return false;
end;
if not(B())then
    return false;
end;
local o=w.CFrame;
a.CFrame=o;
N=o:Inverse();
I=o.Position;
n+=d or 0;
R=n>=0.6;
if R then
    n=0;
end;
return true;
end;
local function o(B)local n=tonumber(B.chamsGlow)or 4;
return if n<1 then
    1
else
    n;
end;
local function B(n,d)return Color3.new(n.R*d,n.G*d,n.B*d);
end;
local n=b.body_parts;
local function d(w,P)if w.Parent~=P then
    return false;
elseif  not(n[w.Name])then
    return false;
end;
if not(w:IsA("BasePart"))then
    return false;
end;
P=w.Size;
return P.X>0.05 and P.Y>0.05 and P.Z>0.05;
end;
local function n(w)local P=w:FindFirstChildOfClass("SpecialMesh");
if P then
    w=P.Scale;
    if typeof(w)=="Vector3"then return w;
end;
end;
return nil;
end;
local function w(P,r)local L,Z=P.Size,P.Name;
local X=L;
if Z=="Head"then local q=n(P);
L=if q then
    X*q
else
    X;
    return if r~=1 then
        L*r
    else
        L;
    end;
    L=n(P);
    if L then
        return X*L;
    end;
    r=x[Z];
    if r then
        return X*r;
    end;
    Z,r,P=X.X,X.Y,X.Z;
    if r>=Z then
        if r>=P then
            return O(Z*1,r*1.08,P*1);
        end;
    end;
    if Z>=r then
        if Z>=P then
            return O(Z*1.08,r*1,P*1);
        end;
    end;
    return O(Z*1,r*1,P*1.08);
end;
E.new=function(O,x)return setmetatable({plr=O,itf=x,parts={},slots=j.weak(),links={},charRef=nil,shown=false,armed=false,fill_col=nil,glow_col=nil,head_trim=1},E);
end;
E.drop_part=function(j,O)local x=j.slots[O];
if not(x)then
    return;
end;
j.slots[O]=nil;
if x.glow then
    pcall(x.glow.Destroy,x.glow);
end;
if x.fill then
    pcall(x.fill.Destroy,x.fill);
end;
end;
local function j(O)local x=Instance.new("BoxHandleAdornment");
x.Adornee=a;
x.Transparency=0;
x.ZIndex=O;
x.Visible=false;
if p then
    x.Shading=p;
end;
if A then
    x.AdornCullingMode=A;
end;
x.Parent=M;
return x;
end;
E.add_part=function(O,x)if O.slots[x]then
    return;
elseif  not(d(x,O.charRef))then
    return;
end;
local p={glow=nil,fill=nil,base=w(x,O.head_trim),size=x.Size};
if O.armed then
    local A,a=j(0),j(1);
    A.Color3=O.glow_col or G;
    a.Color3=O.fill_col or G;
    A.Visible=O.shown;
    a.Visible=O.shown;
    p.glow=A;
    p.fill=a;
    O.fade=nil;
end;
local A=#O.parts+1;
O.parts[A]=x;
O.slots[x]=p;
end;
E.arm=function(O)if O.armed then
    return;
end;
O.armed=true;
local x,p,A,a=O.parts,O.slots,O.fill_col or G,O.glow_col or G;
for n=1,#x,1 do
    O=p[x[n]];
    if O then
        if not(O.fill)then
            local x,p=j(0),j(1);
            x.Color3=a;
            p.Color3=A;
            x.Visible=false;
            p.Visible=false;
            O.glow=x;
            O.fill=p;
        end;
    end;
end;
end;
E.clear=function(j)local O=j.links;
for x=#O,1,-1 do
    pcall(O[x].Disconnect,O[x]);
    O[x]=nil;
end;
O=j.parts;
for x=#O,1,-1 do
    j:drop_part(O[x]);
    O[x]=nil;
end;
table.clear(j.slots);
j.charRef=nil;
j.shown=false;
j.armed=false;
j.fade=nil;
end;
E.bind=function(j,O)j:clear();
if not O or not O.Parent then
    return;
end;
j.charRef=O;
j.head_trim=T[j.itf.getTeam(j.plr)]and 0.88 or 1;
local T=O:GetChildren();
for x=1,#T,1 do
    j:add_part(T[x]);
end;
T=j.links;
T[#T+1]=O.ChildAdded:Connect(function(x)if j.charRef==O then
    j:add_part(x);
end;
end);
T[#T+1]=O.ChildRemoved:Connect(function(T)if j.charRef==O then
    j:drop_part(T);
end;
end);
end;
E.rescan=function(j)if not(j.charRef)then
    return;
end;
local O,T,x=j.parts,j.slots,0;
for p=1,#O,1 do
    local A=O[p];
    p=A and T[A];
    if A then
        if A.Parent then
            if p then
                local T=x+1;
                O[T]=A;
                local a=A.Size;
                if p.size~=a then
                    p.size=a;
                    p.base=w(A,j.head_trim);
                end;
                x=T;
            else
                if A then
                    j:drop_part(A);
                end;
            end;
        else
            if A then
                j:drop_part(A);
            end;
        end;
    else
        if A then
            j:drop_part(A);
        end;
    end;
end;
for j=#O,x+1,-1 do
    O[j]=nil;
end;
end;
E.set_shown=function(j,O)j.shown=O;
local T,x=j.parts,j.slots;
for p=1,#T,1 do
    j=x[T[p]];
    if j then
        if j.fill then
            j.glow.Visible=O;
            j.fill.Visible=O;
        end;
    end;
end;
end;
E.recolor=function(j,O,T)j.fill_col=O;
j.glow_col=T;
local x,p=j.parts,j.slots;
for A=1,#x,1 do
    j=p[x[A]];
    if j then
        if j.fill then
            j.fill.Color3=O;
            j.glow.Color3=T;
        end;
    end;
end;
end;
E.update=function(j)local O=j.itf;
local T=K.shared_for(O,j.plr);
local K,x=T.opt,T.char;
local p=T.en and K and K.chams and x and x.Parent and j.plr~=t;
if if p then
    not M
else
    not p then
        if j.charRef then
            j:clear();
        end;
        return;
    end;
    if j.charRef~=x then
        j:bind(x);
    end;
    if R then
        j:rescan();
    end;
    T,p=j.parts,j.slots;
    local t,A=#T;
    for M=1,t,1 do
        x=T[M];
        if x then
            if x.Parent then
                A=x;
                break;
            end;
        end;
    end;
    x=A~=nil;
    if x then
        local M=O.shSet;
        local a=tonumber(M.maxDis);
        if a then
            if M.limDis then
                local M=I;
                x=if(M-A.Position).Magnitude>a then
                    false
                else
                    x;
                else
                end;
            else
            end;
        else
        end;
        if not x then
            if j.shown then
                j:set_shown(false);
            end;
            return;
        end;
        if not(j.armed)then
            j:arm();
        end;
        if not(j.shown)then
            j:set_shown(true);
        end;
        O=b.parse_col(j,K.chamsOCol[1])or G;
        x=B(O,o(K));
        if j.fill_col~=O then
            j:recolor(O,x);
        elseif  j.glow_col~=x then
            j:recolor(O,x);
        end;
        K=S.fade(j.plr);
        if j.fade~=K then
            j.fade=K;
            x=1-K;
            for b=1,t,1 do
                O=p[T[b]];
                if O then
                    if O.fill then
                        O.fill.Transparency=x;
                        O.glow.Transparency=x;
                    end;
                end;
            end;
        end;
        for b=1,t,1 do
            K=T[b];
            x=K and p[K];
            if x then
                if K.Parent then
                    j=N;
                    b=j*K.CFrame;
                    O=b.Position;
                    local j=i(0.6/Y(O.Magnitude,0.001),1);
                    local K,S,o=CFrame.new(O*j)*(b-O),(x.base*j):Max(h),x.fill;
                    o.CFrame=K;
                    o.Size=S;
                    j=x.glow;
                    j.CFrame=K;
                    j.Size=S*1.12;
                end;
            end;
        end;
    end;
    E.destroy=function(j)j:clear();
end;
return E;
end;

D.C=function()local j,h=D.load("b"),D.load("s");
local b=D.load("x");
local K=j.lp;
local j=h.white;
local S,o=Enum.HighlightDepthMode.AlwaysOnTop,{};
o.__index=o;
o.new=function(t,G)return setmetatable({plr=t,itf=G,inst=nil,char=nil,root=nil,links={},dirty=false,on=false,fc=nil,oc=nil,ft=nil,ot=nil},o);
end;
o.drop_links=function(t)local G=t.links;
for i=#G,1,-1 do
    t=G[i];
    G[i]=nil;
    pcall(t.Disconnect,t);
end;
end;
o.watch=function(t,G)t:drop_links();
if not(G)then
    return;
end;
local i=t.links;
local function Y()t.dirty=true;
end;
i[1]=G.ChildAdded:Connect(Y);
i[2]=G.ChildRemoved:Connect(Y);
end;
o.hide=function(t)local G=t.inst;
if t.on then
    t.on=false;
    if G then
        G.Enabled=false;
    end;
elseif  G then
    if G.Enabled then
        t.on=false;
        if G then
            G.Enabled=false;
        end;
    end;
end;
end;
o.unbind=function(t)t:hide();
t:drop_links();
t.char=nil;
t.root=nil;
t.dirty=false;
local G=t.inst;
if G then
    G.Adornee=nil;
end;
end;
o.ensure=function(t)local G,i=t.inst,h.holder;
if G then
    if G.Parent==i then
        return G;
    end;
end;
if G then
    pcall(G.Destroy,G);
end;
G=Instance.new("Highlight");
G.Enabled=false;
G.DepthMode=S;
G.Parent=i;
t.inst=G;
t.char=nil;
t.on=false;
t.fc=nil;
t.oc=nil;
t.ft=nil;
t.ot=nil;
return G;
end;
o.update=function(S)local t=S.itf;
local G=b.shared_for(t,S.plr);
local b,i,Y=G.opt,G.char,G.en;
if(if Y then
    not b
else
    not Y)or not b.hlt or not i or not i.Parent or S.plr==K then
        if S.char then
            S:unbind();
        end;
        return;
    end;
    Y,G=S:ensure(),S.root;
    if S.char~=i then
        S.char=i;
        G=i:FindFirstChild("HumanoidRootPart")or i:FindFirstChild("Head");
        S.root=G;
        S.dirty=false;
        S:watch(i);
        Y.Adornee=i;
    else
        if if G then
            G.Parent~=i
        else
            not G then
                G=i:FindFirstChild("HumanoidRootPart")or i:FindFirstChild("Head");
                S.root=G;
                S.dirty=G~=nil;
            else
            end;
            if S.dirty or Y.Adornee~=i then
                S.dirty=false;
                Y.Adornee=nil;
                Y.Adornee=i;
                S.on=false;
            end;
        end;
        if not G then
            S:hide();
            return;
        end;
        i=t.shSet;
        if i.limDis then
            t=tonumber(i.maxDis);
            if t then
                if(h.view_frame().Position-G.Position).Magnitude>t then
                    S:hide();
                    return;
                end;
            end;
        end;
        G,t=b.hltFCol,b.hltOCol;
        local b,K,i,O=h.parse_col(S,G[1])or j,h.parse_col(S,t[1])or j,1-(tonumber(G[2])or 0.5),1-(tonumber(t[2])or 1);
        if S.fc~=b then
            S.fc=b;
            Y.FillColor=b;
        end;
        if S.oc~=K then
            S.oc=K;
            Y.OutlineColor=K;
        end;
        if S.ft~=i then
            S.ft=i;
            Y.FillTransparency=i;
        end;
        if S.ot~=O then
            S.ot=O;
            Y.OutlineTransparency=O;
        end;
        if S.on then
            if not(Y.Enabled)then
                S.on=true;
                Y.Enabled=true;
            end;
        else
            S.on=true;
            Y.Enabled=true;
        end;
    end;
    o.destroy=function(j)j:drop_links();
    local h=j.inst;
    j.inst=nil;
    j.char=nil;
    j.root=nil;
    j.dirty=false;
    j.on=false;
    if h then
        pcall(h.Destroy,h);
    end;
end;
return o;
end;

D.D=function()local j=D.load("s");
local h=D.load("v");
local b=D.load("z");
local K=j.white;
local S=Color3.new();
local o,t=math.round,{};
t.__index=t;
t.new=function(G,i)i=assert(i,"No options");
i.en=i.en==nil and true or i.en;
i.txt=i.txt or"{name}";
i.txtCol=i.txtCol or{K,1};
i.txtOut=i.txtOut==nil and true or i.txtOut;
i.txtOCol=i.txtOCol or S;
i.txtSz=i.txtSz or 13;
i.txtFnt=i.txtFnt or 3;
i.limDis=i.limDis or false;
i.maxDis=i.maxDis or 150;
i.txtGrd=i.txtGrd or false;
i.txtGrdCol=i.txtGrdCol or{K,Color3.new(1,0,0)};
return setmetatable({inst=assert(G,"No instance"),opt=i,ph=math.random(),dead=false},t);
end;
t.update=function(K)end;
t.draw=function(K)if K.dead then
    return;
end;
local S=K.inst;
if S then
    if not(S.Parent)then
        K.dead=true;
        return;
    end;
else
    K.dead=true;
    return;
end;
local G=K.opt;
if not(G.en)then
    return;
end;
local i,Y=pcall(S.GetPivot,S);
if not(i)then
    return;
end;
i=Y.Position;
local Y,O,T=j.to_screen(i);
if Y then
    if not(O)then
        return;
    end;
else
    return;
end;
if G.limDis then
    if T>G.maxDis then
        return;
    end;
end;
local j,O,x=G.txt:gsub("{name}",S.Name):gsub("{distance}",o(T)):gsub("{position}",tostring(i)),G.txtSz,G.txtOut and G.txtOCol or nil;
if G.txtGrd then
    b.grad_text(j,Y.X,Y.Y,O,x,G.txtCol[2],G.txtGrdCol[1],G.txtGrdCol[2],K.ph);
elseif  x then
    h.outlined_text(Y,O,G.txtCol[1],G.txtCol[2],x,G.txtCol[2],j,true);
else
    h.text(Y,O,G.txtCol[1],G.txtCol[2],j,true);
end;
end;
t.destroy=function(j)j.dead=true;
j.inst=nil;
end;
return t;
end;

D.E=function()return{shSet={tSz=13,tFnt=3,limDis=false,maxDis=150,useTeam=false},allowlocal=false,tSet={en={en=false,dPos="bottom",wPos="bottom",monPos="right",pnPos="right",armMax=100,box=false,boxType="Static",boxCol={Color3.new(1,0,0),1},boxO=true,boxOCol={Color3.new(),1},boxF=false,boxFCol={Color3.new(1,0,0),0.5},boxGrd=false,boxGrdCol={Color3.new(1,0,0),Color3.new(0,0,1)},boxFGrd=false,boxFGrdCol={Color3.new(1,0,0),Color3.new(0,0,1)},hb=false,hbSide="left",hlCol=Color3.new(0,1,0),dyCol=Color3.new(1,0,0),hbo=true,hboCol={Color3.new(),0.5},hbCol={Color3.new(0,1,0),1},hbGrd=false,hbGrdCol={Color3.new(0,1,0),Color3.new(1,0,0)},ht=false,htCol={Color3.new(1,1,1),1},htOut=true,htOCol=Color3.new(),htGrd=false,htGrdCol={Color3.new(1,1,1),Color3.new(1,0,0)},ab=false,abSide="right",abCol={Color3.fromRGB(0,150,255),1},abo=true,aboCol={Color3.new(),0.5},abGrd=false,abGrdCol={Color3.fromRGB(0,150,255),Color3.fromRGB(0,60,200)},at=false,atCol={Color3.new(1,1,1),1},atOut=true,atOCol=Color3.new(),b3d=false,b3dCol={Color3.new(1,0,0),1},name=false,nCol={Color3.new(1,1,1),1},nOut=true,nOCol=Color3.new(),nGrd=false,nGrdCol={Color3.new(1,1,1),Color3.new(1,0,0)},av=false,wep=false,wCol={Color3.new(1,1,1),1},wOut=true,wOCol=Color3.new(),wGrd=false,wGrdCol={Color3.new(1,1,1),Color3.new(1,0,0)},wepIcon=false,wepIconCol={Color3.new(1,1,1),1},wepIconPos="bottom",wepIconSz=16,mon=false,monCol={Color3.new(1,1,1),1},monOut=true,monOCol=Color3.new(),monGrd=false,monGrdCol={Color3.new(1,1,1),Color3.new(1,0,0)},pn=false,pnCol={Color3.new(1,1,1),1},pnOut=true,pnOCol=Color3.new(),pnGrd=false,pnGrdCol={Color3.new(1,1,1),Color3.new(1,0,0)},bomb=false,bombCol={Color3.fromRGB(255,95,70),1},bombGrd=false,bombGrdCol={Color3.fromRGB(255,95,70),Color3.fromRGB(255,95,70)},bombPos="right",scope=false,scopeCol={Color3.fromRGB(90,170,255),1},scopeGrd=false,scopeGrdCol={Color3.fromRGB(90,170,255),Color3.fromRGB(90,170,255)},scopePos="right",flashed=false,flashedCol={Color3.fromRGB(255,220,70),1},flashedGrd=false,flashedGrdCol={Color3.fromRGB(255,220,70),Color3.fromRGB(255,220,70)},flashedPos="right",defuse=false,defuseCol={Color3.fromRGB(90,220,255),1},defuseGrd=false,defuseGrdCol={Color3.fromRGB(90,220,255),Color3.fromRGB(90,220,255)},defusePos="right",dis=false,dCol={Color3.new(1,1,1),1},dOut=true,dOCol=Color3.new(),dGrd=false,dGrdCol={Color3.new(1,1,1),Color3.new(1,0,0)},tr=false,trOrg="Bottom",trCol={Color3.new(1,0,0),1},tro=true,troCol={Color3.new(),1},offAr=false,offArCol={Color3.new(1,1,1),1},offArSz=22,offArPad=18,offArSmooth=0.08,chams=false,chamsGlow=4,chamsFCol={Color3.new(1,1,1),0.5},chamsOCol={Color3.new(1,1,1),0},chamsWall=false,chamsFWCol={Color3.fromRGB(20,20,20),0.5},chamsOWCol={Color3.new(),0},matChams=false,matChamsType="ForceField",matChamsStyle="Chromatic",matChamsCol=Color3.new(1,1,1),matChamsVisCol={Color3.new(1,1,1),0},matChamsOccCol={Color3.new(0.3,0.3,0.3),0},hlt=false,hltFCol={Color3.new(1,1,1),0.5},hltOCol={Color3.new(1,1,1),1},skel=false,skelCol={Color3.new(1,1,1),1},gskel=false,gskelCol={Color3.new(1,0,0),0.5}},fr={en=false,box=false,boxCol={Color3.new(0,1,0),1},boxO=true,boxOCol={Color3.new(),1},boxF=false,boxFCol={Color3.new(0,1,0),0.5},hb=false,hlCol=Color3.new(0,1,0),dyCol=Color3.new(1,0,0),hbo=true,hboCol={Color3.new(),0.5},ht=false,htCol={Color3.new(1,1,1),1},htOut=true,htOCol=Color3.new(),b3d=false,b3dCol={Color3.new(0,1,0),1},name=false,nCol={Color3.new(1,1,1),1},nOut=true,nOCol=Color3.new(),wep=false,wCol={Color3.new(1,1,1),1},wOut=true,wOCol=Color3.new(),wepIcon=false,wepIconCol={Color3.new(1,1,1),1},wepIconPos="bottom",wepIconSz=16,bomb=false,bombCol={Color3.fromRGB(255,95,70),1},bombGrd=false,bombGrdCol={Color3.fromRGB(255,95,70),Color3.fromRGB(255,95,70)},bombPos="right",scope=false,scopeCol={Color3.fromRGB(90,170,255),1},scopeGrd=false,scopeGrdCol={Color3.fromRGB(90,170,255),Color3.fromRGB(90,170,255)},scopePos="right",flashed=false,flashedCol={Color3.fromRGB(255,220,70),1},flashedGrd=false,flashedGrdCol={Color3.fromRGB(255,220,70),Color3.fromRGB(255,220,70)},flashedPos="right",defuse=false,defuseCol={Color3.fromRGB(90,220,255),1},defuseGrd=false,defuseGrdCol={Color3.fromRGB(90,220,255),Color3.fromRGB(90,220,255)},defusePos="right",dis=false,dCol={Color3.new(1,1,1),1},dOut=true,dOCol=Color3.new(),tr=false,trOrg="Bottom",trCol={Color3.new(0,1,0),1},tro=true,troCol={Color3.new(),1},offAr=false,offArCol={Color3.new(1,1,1),1},offArSz=22,offArPad=18,offArSmooth=0.08,chams=false,chamsGlow=4,chamsFCol={Color3.new(1,1,1),0.5},chamsOCol={Color3.new(1,1,1),0},chamsWall=false,chamsFWCol={Color3.fromRGB(20,20,20),0.5},chamsOWCol={Color3.new(),0},matChams=false,matChamsType="ForceField",matChamsStyle="Chromatic",matChamsCol=Color3.new(1,1,1),matChamsVisCol={Color3.new(1,1,1),0},matChamsOccCol={Color3.new(0.3,0.3,0.3),0},hlt=false,hltFCol={Color3.new(1,1,1),0.5},hltOCol={Color3.new(1,1,1),1}}}};
end;

D.F=function()local j=D.load("b");
local h=D.load("a");
local b=D.load("s");
local K=D.load("t");
local S=D.load("v");
local o=D.load("w");
local t=D.load("z");
local G=D.load("A");
local i=D.load("B");
local Y=D.load("C");
local O=D.load("D");
local T,x=D.load("E"),D.load("p");
local p=D.load("g");
local A=j.players;
local M=j.workspace;
local a=j.http;
local B=j.lp;
local N=math.floor;
local I,R=os.clock,{};
R["Counter-Terrorists"]=Color3.fromRGB(120,170,255);
R.Terrorists=Color3.fromRGB(230,170,60);
R.CT=Color3.fromRGB(120,170,255);
R.T=Color3.fromRGB(230,170,60);
local n={};
n.ViewResolver=b.resolver;
n._loaded=false;
n._objCache={};
n._clones={};
n.wlist=T.wlist or{};
n.shSet=T.shSet;
n.allowlocal=T.allowlocal==true;
n.tSet=T.tSet;
local T,E,d={},0,0;
local function w()return M:FindFirstChild("Characters");
end;
local function P(r)return r.Character;
end;
local function r(L)return typeof(L)=="Instance"and L.Parent~=nil and L:IsDescendantOf(M)and L:GetAttribute("ClientCharacterPresentationVisible")~=false;
end;
local function M(L)if not(L)then
    return nil;
end;
local Z,X=pcall(P,L);
if Z then
    if r(X)then
        return X;
    end;
end;
X=L.Name;
if type(X)=="string"then L=w();
if L then
    Z=L:FindFirstChild(X);
    if r(Z)then
        return Z;
    end;
end;
end;
return nil;
end;
local function w(P)if not(P)then
    return nil;
end;
local L,Z=pcall(P.GetAttribute,P,"Team");
if L then
    if type(Z)=="string"then if Z~=""then return Z;
end;
end;
end;
return nil;
end;
local P,L={},0;
local function Z(X)return a:JSONDecode(X);
end;
local function a(X)if type(X)~="string"then return nil;
elseif  X==""then return nil;
end;
local q=P[X];
if q~=nil then
    return q or nil;
end;
local q,U=pcall(Z,X);
if L>500 then
    table.clear(P);
    L=0;
end;
L+=1;
if q then
    if type(U)=="table"then P[X]=U;
    return U;
end;
end;
P[X]=false;
return nil;
end;
local Z=j.weak();
n.getIndicators=function(X,q,U)local z=Z[X];
if z then
else
    z={bomb=false,scope=false,flashed=false,defuse=false};
    Z[X]=z;
end;
if typeof(X)~="Instance"then if not(p.is(X))then
    z.bomb=false;
    z.scope=false;
    z.flashed=false;
    z.defuse=false;
    return z;
end;
end;
local Z=X:GetAttribute("Slot5");
if z.slot5~=Z then
    z.slot5=Z;
    local J=a(Z);
    z.bomb=J~=nil and J.Weapon=="C4";
end;
z.scope=(tonumber(X:GetAttribute("ScopeIncrement"))or 0)>0;
z.defuse=X:GetAttribute("IsDefusingBomb")==true;
if not(U)then
    z.flashed=false;
    return z;
end;
Z=I();
if z.char~=q or Z>=(z.refresh or 0)then
    z.char=q;
    z.refresh=Z+0.05;
    z.flashed=false;
    U=z.animator;
    if if U then
        U.Parent==nil
    else
        not U then
            U=q and(q:FindFirstChildWhichIsA("Animator",true));
            z.animator=U;
        else
        end;
        if U then
            local Z,q=pcall(U.GetPlayingAnimationTracks,U);
            if Z then
                for Z=1,#q,1 do
                    X=q[Z];
                    Z=X.Animation;
                    if X.IsPlaying then
                        if Z then
                            if Z.AnimationId=="rbxassetid://101513162753523"then z.flashed=true;
                            break;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
return z;
end;
n.getChar=function(Z)local X=x.char(Z);
if X==false then
    return nil;
end;
local q=n._clones[Z];
if q then
    X=q.model;
    if X then
        if not(X.Parent)then
            return nil;
        end;
    else
        return nil;
    end;
else
    if X==nil then
        X=(M(Z));
    else
        if not(x.ghost(X))then
            if not(r(X))then
                return nil;
            end;
        end;
    end;
end;
if X then
    if X:GetAttribute("CharacterType")~="PlayerCustomCharacter"then return nil;
end;
else
    return nil;
end;
q,Z=pcall(X.GetAttribute,X,"Dead");
if q then
    if Z==true then
        return nil;
    end;
end;
return X;
end;
n.isFr=function(r)if not(r)then
    return false;
end;
if r==B then
    return true;
end;
local Z=b.frame();
if n._mtFrame~=Z then
    n._mtFrame=Z;
    n._mt=w(B);
end;
local B,Z=n._mt,w(r);
if B then
    if not(Z)then
        return false;
    end;
else
    return false;
end;
return B==Z;
end;
n.getTC=function(B)local r=w(B);
return r and R[r]or nil;
end;
n.getTeam=function(B)return w(B);
end;
n.getHp=function(B,R)R=R or B and(M(B));
if not(R)then
    return 0,100;
end;
if R:GetAttribute("Dead")==true then
    return 0,R:GetAttribute("MaxHealth")or 100;
end;
local M,B=R:GetAttribute("Health"),R:GetAttribute("MaxHealth");
return if type(M)~="number"then 100
else
    M,if type(B)~="number"then 100
else
    if B<=0 then
        100
    else
        B;
    end;
    n.getArm=function(M)if not(M)then
        return 0;
    end;
    local B=a(M:GetAttribute("Armor"));
    if B then
        if type(B.Health)=="number"then return B.Health;
    end;
end;
return 0;
end;
n.getWep=function(M)if not(M)then
    return"";
end;
local B=a(M:GetAttribute("CurrentEquipped"));
if B then
    if type(B.Name)=="string"then return B.Name;
end;
end;
return"";
end;
n.getPing=function(M)if not(M)then
    return 0;
end;
local a=M:GetAttribute("Ping");
return type(a)=="number"and N(a+0.5)or 0;
end;
n.getMoney=function(M)if not(M)then
    return 0;
end;
local a=M:GetAttribute("Money");
return type(a)=="number"and N(a+0.5)or 0;
end;
local function M(a,B,N,R,w)local r={key=a,state=B,cham=N,kind=R,hl=w};
T[#T+1]=r;
n._objCache[a]=r;
return r;
end;
local function a(B)local N=n._objCache[B];
if not(N)then
    return;
end;
n._objCache[B]=nil;
for R=1,#T,1 do
    if T[R]==N then
        B=#T;
        T[R]=T[B];
        T[B]=nil;
        break;
    end;
end;
if N.state then
    if N.state.destroy then
        pcall(N.state.destroy,N.state);
    end;
end;
if N.cham then
    pcall(N.cham.destroy,N.cham);
end;
if N.hl then
    pcall(N.hl.destroy,N.hl);
end;
end;
local function B(N)if n._objCache[N]then
    return;
end;
M(N,G.new(N,n),i.new(N,n),"player",Y.new(N,n));
end;
local function Y(N)a(N);
end;
n.AddInst=function(N,R)if n._objCache[N]then
    return n._objCache[N].state;
end;
local w=O.new(N,R);
M(N,w,nil,"inst");
return w;
end;
n.AddClone=function(O,N,R)if n._loaded then
    if O then
        if not(N)then
            return nil;
        end;
    else
        return nil;
    end;
else
    return nil;
end;
local w={Name=N.Name,DisplayName=N.DisplayName,UserId=N.UserId,Character=O,Parent=A};
n._clones[w]={model=O,real=N,viewport=R};
E+=1;
M(w,G.new(w,n),nil,"clone");
return w;
end;
n.RemoveClone=function(G)if G then
    if not(n._clones[G])then
        return;
    end;
else
    return;
end;
n._clones[G]=nil;
E-=1;
if E<0 then
    E=0;
end;
a(G);
end;
n.UpdateClone=function(G,O)local M=G and n._clones[G];
if not(M)then
    return;
end;
M.model=O;
G.Character=O;
end;
local G,O=false,false;
local function M(a)S.scale(1);
a:draw();
end;
local function a(N)local R=N.state;
R:update();
S.scale(x.fade(R.plr));
t.draw(R);
S.scale(1);
R=N.cham;
if R then
    if G then
        R:update();
    end;
end;
R=N.hl;
if R then
    if O then
        R:update();
    end;
end;
end;
local function t()for x=1,#T,1 do
    local N=T[x];
    if N.kind=="inst"then pcall(M,N.state);
else
    pcall(a,N);
end;
end;
end;
local function x()for M=1,#T,1 do
    local a=T[M].hl;
    if a then
        pcall(a.unbind,a);
    end;
end;
end;
local function M()for a=1,#T,1 do
    local N=T[a].cham;
    if N then
        pcall(N.clear,N);
    end;
end;
end;
local function a()if not(n._loaded)then
    return;
end;
local N,R=n.tSet.en,n.tSet.fr;
local w,r=N.en,R.en;
if w then
elseif  r then
elseif  E==0 then
    if O then
        O=false;
        x();
    end;
    if G then
        G=false;
        M();
    end;
    return;
end;
local Z,X=(w and N.chams or r and R.chams)and true or false,(w and N.hlt or r and R.hlt)and true or false;
if G then
    if not(Z)then
        M();
    end;
end;
if O then
    if not(X)then
        x();
    end;
end;
G,O=Z,X;
w=I();
Z=d>0 and w-d or 0;
d=w;
b.begin_frame();
K.mask_step();
o.open();
if G then
    i.begin_frame(Z);
end;
t();
S.scale(1);
o.close();
end;
n.step=a;
local function b()for t=1,#T,1 do
    local i=T[t];
    t=i.state;
    if i.kind~="inst"then if t.validate then
        if not(t:validate())then
            t.cacheValid=false;
        end;
    end;
end;
end;
end;
n.Load=function()if n._loaded then
    return;
end;
n._loaded=true;
local t=A:GetPlayers();
for i=1,#t,1 do
    B(t[i]);
end;
local t,i=p.list();
for x=1,i,1 do
    B(t[x]);
end;
h.connect(A.PlayerAdded,B);
h.connect(A.PlayerRemoving,Y);
p.on(function(t)if n._loaded then
    B(t);
end;
end,Y);
S.run(a);
local S=0;
h.connect(j.run.Heartbeat,function(j)S+=j;
if S<0.1 then
    return;
end;
S=0;
b();
end);
end;
n.Unload=function()if not(n._loaded)then
    return;
end;
n._loaded=false;
for j=#T,1,-1 do
    local b=T[j];
    T[j]=nil;
    if b.state then
        if b.state.destroy then
            pcall(b.state.destroy,b.state);
        end;
    end;
    if b.cham then
        pcall(b.cham.destroy,b.cham);
    end;
    if b.hl then
        pcall(b.hl.destroy,b.hl);
    end;
end;
G,O=false,false;
table.clear(n._objCache);
table.clear(n._clones);
table.clear(P);
L,E=0,0;
for j=#n.wlist,1,-1 do
    n.wlist[j]=nil;
end;
o.purge();
K.purge();
end;
h.teardown(n.Unload);
return n;
end;

D.L=function()local j=D.load("b");
local h=D.load("a");
local b,K=D.load("j"),j.workspace;
local S=b.raycast;
local o=Enum.Material;
local t=o.Metal;
local G=table.clear;
local i,Y,O=math.max,{},{};
O[o.Cardboard]=10;
O[o.Fabric]=25;
O[o.Glass]=25;
O[o.Plastic]=10;
O[o.SmoothPlastic]=10;
O[o.Wood]=10;
O[o.WoodPlanks]=10;
local T,x,p={["Sandy Brick"]=0,IndoorWall=0},{Reactor=-1};
local function A()local M=K:FindFirstChild("Debris");
p=M and M:FindFirstChild("RaycastVisualizers")or nil;
return M;
end;
o=A();
if o then
    h.connect(o.ChildAdded,function(M)if M.Name=="RaycastVisualizers"then p=M;
end;
end);
h.connect(o.ChildRemoved,function(M)if M==p then
    p=nil;
end;
end);
else
    h.connect(K.ChildAdded,function(M)if M.Name=="Debris"then A();
end;
end);
end;
local A,M={ready=true},RaycastParams.new();
M.FilterType=Enum.RaycastFilterType.Exclude;
M.IgnoreWater=false;
M.CollisionGroup="Bullet";
local a=RaycastParams.new();
a.CollisionGroup="Bullet";
local B=RaycastParams.new();
B.FilterType=Enum.RaycastFilterType.Include;
B.CollisionGroup="Bullet";
local N,I,R={},{},{};
local n,E=j.weak(),{instance=nil,position=nil,normal=nil,material=nil};
local function d(w)local P=n[w];
if P~=nil then
    return P;
end;
P=w.Name=="CollisionCapsule"or w.Name=="HumanoidRootPart"or w:HasTag("CharacterAccessory")or w:FindFirstAncestorWhichIsA("Accessory")~=nil or p~=nil and w:IsDescendantOf(p);
n[w]=P;
return P;
end;
local function n(w)local P=w.Parent;
if P then
    if P:HasTag("BreakableDoor")then
        return t;
    end;
end;
return w.Material;
end;
local function t(w)if w~=0 then
    return w;
end;
local P=K:GetAttribute("Map");
if typeof(P)~="string"then return w;
end;
return x[P]or w;
end;
local function x(w,P,r,L)r=r or M;
r.FilterDescendantsInstances=L or Y;
local M=(K:Raycast(w,P,r));
while M do
    local L=M.Instance;
    if not(d(L))then
        E.instance=L;
        E.position=M.Position;
        E.normal=M.Normal;
        E.material=M.Material;
        return E;
    end;
    r:AddToFilter(L);
    M=(K:Raycast(w,P,r));
end;
E.instance=nil;
E.position=w+P;
E.normal=nil;
E.material=nil;
return E;
end;
local function M(w,P,r,L)local Z=x(w,P,r,L);
return{instance=Z.instance,position=Z.position,normal=Z.normal,material=Z.material};
end;
local function w(P,r,L,Z,X,q)a.FilterDescendantsInstances=Z or Y;
G(I);
G(R);
Z=r.Unit;
local Y,U,z,J,y=Z*1000,{},false,P,0;
for f=1,100,1 do
    if z then
        break;
    end;
    r=1000;
    if q then
        r=q+8-i((J-P):Dot(Z),0);
        if r<=0 then
            break;
        end;
    else
    end;
    f=K:Raycast(J,Z*r,a);
    if not f then
        break;
    end;
    local i=f.Instance;
    a:AddToFilter(i);
    if d(i)then
    else
        local a=f.Position;
        y+=1;
        U[y]={instance=i,position=a,normal=f.Normal,material=n(i)};
        local d=X~=nil and(i.Parent==X or i:IsDescendantOf(X));
        z=if d then
            true
        else
            if q then
                if(a-P):Dot(Z)>=q then
                    true
                else
                    z
                else
                    z;
                    N[1]=i;
                    B.FilterDescendantsInstances=N;
                    local i=a+Y;
                    local Y=K:Raycast(i,a-i,B);
                    if not(Y)then
                        break;
                    end;
                    local K,B=Y.Instance,(a-Y.Position).Magnitude;
                    i=K.MaterialVariant;
                    local P,r=i~=""and T[i]or nil;
                    if P~=nil then
                        if not(d)then
                            a=(R[i]or 0)+B;
                            R[i]=a;
                            if a>t(P)+L then
                                break;
                            end;
                        end;
                        r=(n(K));
                    else
                        local i=n(K);
                        if not(d)then
                            local T=(I[i]or 0)+B;
                            I[i]=T;
                            if T>t(O[i]or 0)+L then
                                break;
                            end;
                        end;
                        r=Y.Material;
                    end;
                    y+=1;
                    U[y]={instance=K,position=Y.Position,normal=Y.Normal,material=r};
                    J=Y.Position;
                end;
            end;
            return U;
        end;
        A.cast=M;
        A.probe=x;
        A.through=w;
        A.patch=function(K)if type(S)~="table"then return;
    elseif  type(K)~="function"then return;
end;
local t=j.getups;
if type(t)~="function"then return;
end;
local j,i=pcall(t,K);
if j then
    if type(i)~="table"then return;
end;
else
    return;
end;
for j,t in i,nil,nil do
    if t==S.cast then
        h.upvalue(K,j,M);
    elseif  t==S.castThrough then
        h.upvalue(K,j,w);
    end;
end;
end;
o=b.bullet;
if type(o)=="table"then A.patch(rawget(o,"_performRaycast"));
end;
h.teardown(function()G(N);
G(I);
G(R);
E.instance=nil;
E.position=nil;
E.normal=nil;
E.material=nil;
p=nil;
end);
return A;
end;

D.M=function()local j=D.load("b").lp;
return{origin=function(h)local b=h.ViewportSize;
local K,S=h:ViewportPointToRay(b.X*0.5,b.Y*0.5).Origin,j.Character;
if not(S)then
    return K,false;
end;
h=nil;
b=S:FindFirstChild("CameraPart");
if b and(b:IsA("BasePart"))then
    h=b.Position;
else
    local j=S:FindFirstChild("Head");
    if j and(j:IsA("BasePart"))then
        h=j.Position;
    else
        local j=S:FindFirstChild("HumanoidRootPart");
        h=if j then
            if j:IsA("BasePart")then
                j.Position+Vector3.new(0,1.6,0)
            else
                h
            else
                h;
            end;
        end;
        if not h then
            return K,false;
        end;
        if(h-K).Magnitude>1 then
            return h,true;
        end;
        return h,false;
    end
};
end;

D.V=function()local j={weapon=nil,cframe=nil,yaw=0,pitch=0,expires=0,cmd_samples=0};
j.cmd_active=function(h)h=h or os.clock();
if j.cmd_samples<=0 then
    return false;
elseif  h>j.expires then
    return false;
end;
if type(j.yaw)~="number"then return false;
elseif  type(j.pitch)~="number"then return false;
end;
return true;
end;
j.cmd_consume=function()if j.cmd_samples>0 then
    j.cmd_samples=j.cmd_samples-1;
end;
end;
j.clear=function()j.weapon=nil;
j.cframe=nil;
j.yaw=0;
j.pitch=0;
j.expires=0;
j.cmd_samples=0;
end;
return j;
end;

D.Y=function()local j=D.load("b");
local h,b=j.module(j.storage,"Components","Common","WeaponTimings"),{};
b.last=j.weak();
b.global_last=0;
b.min_interval=function(j)local K=0.05;
if type(j)~="table"then return K;
end;
if type(h)=="table"then if type(h.MinShotInterval)=="function"then local S,o=pcall(h.MinShotInterval,j);
K=if S then
    if type(o)=="number"then if o>0 then
        if o<math.huge then
            if o>K then
                o
            else
                K
            else
                K
            else
                K
            else
                K
            else
                K;
            else
            end;
        else
        end;
        local h=tonumber(j.FireRate);
        K=if h then
            if h>0 then
                if h>K then
                    h
                else
                    K
                else
                    K
                else
                    K;
                    h=j.FireModes;
                    if type(h)=="table"then j=h.Primary;
                    if type(j)=="table"then local S=tonumber(j.FireRate);
                    K=if S then
                        if S>0 then
                            if S<K then
                                S
                            else
                                K
                            else
                                K
                            else
                                K;
                            else
                            end;
                            local j=h.Secondary;
                            if type(j)=="table"then local h=tonumber(j.FireRate);
                            K=if h then
                                if h>0 then
                                    if h<K then
                                        h
                                    else
                                        K
                                    else
                                        K
                                    else
                                        K;
                                    else
                                    end;
                                else
                                end;
                                return if K<0.05 then
                                    0.05
                                else
                                    K;
                                end;
                                b.wait=function(j,h,K)K=K or os.clock();
                                local S=if h==nil then
                                    if j then
                                        j.Properties
                                    else
                                        h
                                    else
                                        h;
                                        local o,t=b.min_interval(S),b.global_last;
                                        if j then
                                            h=b.last[j];
                                            t=if h then
                                                if h>t then
                                                    h
                                                else
                                                    t
                                                else
                                                    t;
                                                else
                                                end;
                                                j=t+o-K;
                                                if j>0 then
                                                    return j;
                                                end;
                                                return 0;
                                            end;
                                            b.ready=function(j,h,K)return b.wait(j,h,K)<=0;
                                        end;
                                        b.mark=function(j,h)h=h or os.clock();
                                        if j then
                                            b.last[j]=h;
                                        end;
                                        b.global_last=h;
                                    end;
                                    b.clear=function(j)if j then
                                        b.last[j]=nil;
                                    end;
                                end;
                                return b;
                            end;

D.aj=function()local m,j,h=D.load("b"),D.load("ai"),D.load("ag");
local b=D.load("ah");
local K=D.load("p");
local S=m.lp;
local o=m.workspace;
local t=m.players;
local G=j.teams;
local j=os.clock;
local i=m.weak();
local Y,O=m.weak(),{};
local function m(T)local x=Y[T];
if x then
else
    x={stamp=0,shield_stamp=0,shield=false,player=nil,ok=false,root=nil};
    Y[T]=x;
end;
return x;
end;
O.part=function(Y,T)local x=i[Y];
if x then
else
    x={};
    i[Y]=x;
end;
local i=x[T];
if i then
    if i.Parent==Y then
        return i;
    end;
end;
i=Y:FindFirstChild(T);
i=i and(if i:IsA("BasePart")then
    i
else
    nil);
    x[T]=i;
    return i;
end;
O.shielded=function(i)local Y,T=m(i),j();
if T<Y.shield_stamp then
    return Y.shield;
end;
local x=i:FindFirstChildWhichIsA("ForceField",true)~=nil;
Y.shield_stamp=T+0.1;
Y.shield=x;
return x;
end;
O.alive=function(i)if i then
    if not(i:IsDescendantOf(o))then
        return false;
    end;
else
    return false;
end;
if i:GetAttribute("Dead")~=false then
    return false;
end;
local Y=i:GetAttribute("Health");
return typeof(Y)=="number"and Y>0;
end;
local function i(Y,T,x)if T:GetAttribute("Dead")~=false then
    return false;
elseif  T:GetAttribute("Invincible")==true then
    return false;
end;
if Y:GetAttribute("Invincible")==true then
    return false;
elseif  Y:GetAttribute("Dead")==true then
    return false;
end;
local p=T:GetAttribute("Health");
if typeof(p)~="number"then return false;
elseif  p<=0 then
    return false;
end;
local A=j();
if A>=x.shield_stamp then
    x.shield_stamp=A+0.1;
    x.shield=T:FindFirstChildWhichIsA("ForceField",true)~=nil;
end;
if x.shield then
    return false;
end;
if p-b.pending(T,p)<=0 then
    return false;
end;
p=O.part(T,"HumanoidRootPart");
if not p then
    return false;
end;
if not(O.part(T,"Head"))then
    return false;
end;
if not(O.part(T,"UpperTorso"))then
    return false;
end;
if not(O.part(T,"LowerTorso"))then
    return false;
end;
if h.team_check then
    A,T=S:GetAttribute("Team"),Y:GetAttribute("Team");
    if A then
        if not T then
            return false;
        end;
    else
        return false;
    end;
    if G[A]then
        if not(G[T])then
            return false;
        end;
    else
        return false;
    end;
    if o:GetAttribute("Gamemode")~="Deathmatch"then if A==T then
        return false;
    end;
end;
end;
return true,p;
end;
O.valid=function(h,b)if h then
    if h==S then
        return false;
    elseif  h.Parent~=t then
        return false;
    elseif  b then
    else
        return false;
    end;
else
    return false;
end;
if not(K.armed(h,b))then
    if h.Character~=b then
        return false;
    elseif  not(b:IsDescendantOf(o))then
        return false;
    end;
end;
local K,S=m(b),j();
if K.player==h then
    if S<K.stamp then
        return K.ok,K.root;
    end;
end;
local m,j=i(h,b,K);
K.stamp=S+0.005;
K.player=h;
K.ok=m;
K.root=j;
return m,j;
end;
return O;
end;

D.ak=function()local m,j,h,b,K,S=D.load("b"),D.load("f"),D.load("a"),D.load("j"),D.load("L"),D.load("ag");
local o=D.load("aj");
local t=m.lp;
local G=m.workspace;
local i,Y=m.storage,K.probe;
local O=K.through;
local T=j.copy_with;
local x=j.trim;
local p=math.sqrt;
local A=math.abs;
local M,M,M=math.max,math.min,{on=false,power=1,step=0.015625,ticks=2,gravity=60,max_speed=262.5,ground_speed=24.375,measured=0};
local a=m.weak();
local B,N;
local I=-1;
m,j=i:FindFirstChild("MovementV2"),b.kinematics;
if m then
    i=m:FindFirstChild("Config");
    if i then
        if i:IsA("ModuleScript")then
            local R,n=pcall(require,i);
            K=R and type(n)=="table"and n.Default or nil;
            if type(K)=="table"then R=K.SimulationHz;
            if type(R)=="number"then if R>=20 then
                if R<=240 then
                    M.step=1/R;
                end;
            end;
        end;
        n=K.RenderInterpolationTicks;
        if type(n)=="number"then if n>=0 then
            M.ticks=n;
        end;
    end;
end;
end;
end;
local K=m:FindFirstChild("Simulation");
i=K and(K:FindFirstChild("Config"));
if i then
    if i:IsA("ModuleScript")then
        local R,n=pcall(require,i);
        K=R and type(n)=="table"and n.Default or nil;
        if type(K)=="table"then R=K.Gravity;
        if type(R)=="number"then if R>0 then
            M.gravity=R;
        end;
    end;
    n=K.MaxVelocity;
    if type(n)=="number"then if n>0 then
        M.max_speed=n;
    end;
end;
local i=K.MaxBaseMoveSpeed;
if type(i)=="number"then if i>0 then
    M.ground_speed=i*1.25;
end;
end;
end;
end;
end;
end;
m=b.char_velocity;
if type(m)=="function"then B=m;
else
    if j and type(j.getVelocity)=="function"then local m=j.getVelocity;
    B=function(b)return m(b,b.PrimaryPart);
end;
else
end;
end;
if j then
    if type(j.isOnGround)=="function"then local m=j.isOnGround;
    N=m;
else
end;
else
end;
local m,j,b,K,i=B,N,{},{},{};
local B=RaycastParams.new();
B.FilterType=Enum.RaycastFilterType.Include;
B.IgnoreWater=false;
B.CollisionGroup="Bullet";
local N=RaycastParams.new();
N.FilterType=Enum.RaycastFilterType.Exclude;
N.IgnoreWater=false;
N.CollisionGroup="Bullet";
local R=RaycastParams.new();
R.FilterType=Enum.RaycastFilterType.Exclude;
R.IgnoreWater=false;
R.CollisionGroup="Bullet";
M.lead=function()local n=I;
if n~=M.power then
    I=M.power;
    S.reg_hits=0;
    S.reg_miss=0;
    S.reg_lead=0;
end;
if not(M.on)then
    return 0;
end;
n=tonumber(M.power);
if n then
    if n~=n then
        return 0;
    elseif  A(n)<0.001 then
        return 0;
    end;
else
    return 0;
end;
local S=t:GetNetworkPing();
S=if type(S)~="number"then 0.05
else
    if S~=S then
        0.05
    else
        if S<=0 then
            0.05
        else
            if S>1 then
                1
            else
                S;
                M.measured=S;
                local t=S*n;
                if t~=t then
                    return 0;
                elseif  A(t)<0.001 then
                    return 0;
                end;
                if t>2 then
                    return 2;
                end;
                if t<-2 then
                    return-2;
                end;
                return t;
            end;
            M.filter=function(S,t)return T(b,S,t);
        end;
        local function S(t,T)local I=o.part(t,"HumanoidRootPart");
        if not(I)then
            return T;
        end;
        local n=o.part(t,"LeftFoot")or o.part(t,"RightFoot");
        local E,d=if n then
            n.Position.Y-n.Size.Y*0.5
        else
            I.Position.Y-I.Size.Y*0.5-2,-T.Y;
            i[1]=t;
            x(i,1);
            N.FilterDescendantsInstances=i;
            n=G:Raycast(I.Position,Vector3.new(0,-(d+6),0),N);
            if not n then
                return T;
            end;
            t=E-n.Position.Y;
            t=if t~=t then
                0
            else
                if t<0 then
                    0
                else
                    t;
                    if d<=t then
                        return T;
                    end;
                    return Vector3.new(T.X,-t,T.Z);
                end;
                local function t(T)local N=o.part(T,"HumanoidRootPart");
                if not(N)then
                    return Vector3.zero;
                end;
                local I,n,E=os.clock(),N.Position,a[T];
                if not(E)then
                    a[T]={pos=n,time=I,vel=Vector3.zero};
                    return Vector3.zero;
                end;
                T=I-E.time;
                if T<0.008 then
                    return E.vel;
                end;
                if T>0.5 then
                    E.pos=n;
                    E.time=I;
                    E.vel=Vector3.zero;
                    return Vector3.zero;
                end;
                N=(n-E.pos)/T;
                E.pos=n;
                E.time=I;
                T,I=N.X,N.Z;
                n=p(T*T+I*I);
                if n~=n then
                    N=Vector3.zero;
                else
                    if n>M.ground_speed then
                        local p=M.ground_speed/n;
                        N=Vector3.new(T*p,N.Y,I*p);
                    else
                    end;
                end;
                n=N.Y;
                N=if n~=n then
                    Vector3.zero
                else
                    if n>M.max_speed then
                        Vector3.zero
                    else
                        if n<-M.max_speed then
                            Vector3.zero
                        else
                            N;
                            E.vel=N;
                            return N;
                        end;
                        M.offset=function(T,p)if T then
                            if A(p)<0.001 then
                                return Vector3.zero;
                            end;
                        else
                            return Vector3.zero;
                        end;
                        local a=if m then
                            (m(T))
                        else
                            nil;
                            if typeof(a)~="Vector3"or a.Magnitude<0.05 then
                                local m=o.part(T,"HumanoidRootPart");
                                a=m and m.AssemblyLinearVelocity or nil;
                            else
                            end;
                            a=if typeof(a)~="Vector3"then t(T)
                        else
                            if a.Magnitude<0.05 then
                                t(T)
                            else
                                a;
                                local m=a.Magnitude;
                                if m~=m then
                                    return Vector3.zero;
                                elseif  m<0.05 then
                                    return Vector3.zero;
                                end;
                                local o,t=(if m>M.max_speed then
                                    a*(M.max_speed/m)
                                else
                                    a)*p,j and j(T)or nil;
                                    o=if t==true then
                                        Vector3.new(o.X,0,o.Z)
                                    else
                                        if t==false then
                                            if p>0 then
                                                o-Vector3.new(0,0.5*M.gravity*p*p,0)
                                            else
                                                o
                                            else
                                                o;
                                                if o.X~=o.X then
                                                    return Vector3.zero;
                                                elseif  o.Y~=o.Y then
                                                    return Vector3.zero;
                                                elseif  o.Z~=o.Z then
                                                    return Vector3.zero;
                                                end;
                                                return if o.Y<-0.05 then
                                                    S(T,o)
                                                else
                                                    o;
                                                end;
                                                local function m(j,S,o,t)local T,p,a,N,I,n,E=o:PointToObjectSpace(j),o:VectorToObjectSpace(S),t*0.5,-math.huge,0,-1,math.huge;
                                                for d=1,3,1 do
                                                    S,j,t=nil;
                                                    if d==1 then
                                                        S,j,t=T.X,p.X,a.X;
                                                    else
                                                        if d==2 then
                                                            S,j,t=T.Y,p.Y,a.Y;
                                                        else
                                                            S,j,t=T.Z,p.Z,a.Z;
                                                        end;
                                                    end;
                                                    if A(j)<1.0E-7 then
                                                        if S<-t then
                                                            return nil;
                                                        elseif  S>t then
                                                            return nil;
                                                        end;
                                                    else
                                                        local T,p,A,w=(-t-S)/j,(t-S)/j,-1,n;
                                                        if T>p then
                                                            A=1;
                                                            T,p,n=p,T,A;
                                                        else
                                                            n=A;
                                                        end;
                                                        if T>N then
                                                            N,I=T,d;
                                                        else
                                                            n=w;
                                                        end;
                                                        E=if p<E then
                                                            p
                                                        else
                                                            E;
                                                            if N>E then
                                                                return nil;
                                                            end;
                                                        end;
                                                    end;
                                                    if I==0 then
                                                        return nil;
                                                    elseif  N~=N then
                                                        return nil;
                                                    elseif  N<=0.05 then
                                                        return nil;
                                                    end;
                                                    a=if I==1 then
                                                        Vector3.new(n,0,0)
                                                    else
                                                        if I==2 then
                                                            Vector3.new(0,n,0)
                                                        else
                                                            Vector3.new(0,0,n);
                                                            return N,o:VectorToWorldSpace(a);
                                                        end;
                                                        M.hit=function(j,S,o,t,T)K[1]=o;
                                                        x(K,1);
                                                        B.FilterDescendantsInstances=K;
                                                        local p=j-t;
                                                        local A=G:Raycast(p,S*(T+1),B);
                                                        if A then
                                                            if A.Instance==o then
                                                                local G=(A.Position-p).Magnitude;
                                                                if G>0.05 then
                                                                    if G<=T+1 then
                                                                        return G,A.Normal;
                                                                    end;
                                                                end;
                                                            end;
                                                        end;
                                                        return m(j,S,o.CFrame+t,o.Size);
                                                    end;
                                                    M.path=function(m,j,S,o,t)local G,T=S-0.02,Y(m,j*S,R,t);
                                                    if T then
                                                        if not(T.instance)then
                                                            return 0,0,nil,nil;
                                                        end;
                                                    else
                                                        return 0,0,nil,nil;
                                                    end;
                                                    local Y=T.position-m;
                                                    if Y.X*j.X+Y.Y*j.Y+Y.Z*j.Z>=G then
                                                        return 0,0,nil,nil;
                                                    end;
                                                    if not(o)then
                                                        return 2,0,nil,nil;
                                                    end;
                                                    Y=O(m+j*-0.001,j*(S+0.001),o,t,nil,S);
                                                    if not Y then
                                                        return 2,0,nil,nil;
                                                    end;
                                                    T=0;
                                                    for o=1,#Y,1 do
                                                        t=Y[o];
                                                        if not(t.instance)then
                                                            break;
                                                        end;
                                                        S=t.position-m;
                                                        if S.X*j.X+S.Y*j.Y+S.Z*j.Z>=G then
                                                            break;
                                                        end;
                                                        T=o;
                                                    end;
                                                    if T==0 then
                                                        return 2,0,nil,nil;
                                                    elseif  T%2~=0 then
                                                        return 2,0,nil,nil;
                                                    end;
                                                    return 1,T*0.5,Y,T+1;
                                                end;
                                                h.teardown(function()M.on=false;
                                                x(b,0);
                                                x(K,0);
                                                x(i,0);
                                            end);
                                            return M;
                                        end;

D.am=function()local m,j=D.load("b"),D.load("a");
local h=D.load("h");
local b,K=D.load("ai"),m.lp;
local S=m.workspace;
local o=m.players;
local t=b.teams;
local b,G,i,Y,O=string.lower,{},{},{},{};
local T=m.weak();
local m;
local x=false;
local p={picked=G,values=O,set=function(A)if x then
    return;
end;
local M={};
if type(A)=="table"then for a,B in A,nil,nil do
    local N=if type(a)=="string"and B==true then
        a
    else
        if type(B)=="string"then B
    else
        nil;
        B=N and i[N];
        if B then
            M[B]=true;
        end;
    end;
elseif  type(A)=="string"then local a=i[A];
if a then
    M[a]=true;
end;
end;
table.clear(G);
for A in M,nil,nil do
    G[A]=true;
end;
end
};
local function A(M,a)local B,N=b(M),b(a);
if B==N then
    return M<a;
end;
return B<N;
end;
p.refresh=function(b)table.clear(i);
table.clear(Y);
local M,a,B={},h.all();
local h,N=K:GetAttribute("Team"),S:GetAttribute("Gamemode")=="Deathmatch";
local I,R=t[h]==true,0;
for n=1,B,1 do
    local B=a[n];
    if B~=b then
        if B~=K then
            if B.Parent==o then
                if not(T[B])then
                    local b,K=j.adopt,function()p.refresh();
                end;
                T[B]=b(B:GetAttributeChangedSignal("Team"):Connect(K));
            end;
            n=B:GetAttribute("Team");
            if I and t[n]and(N or h~=n)then
                local h,b=B.UserId,B.DisplayName;
                local K,t=if b==B.Name then"@"..B.Name
            else
                b.." (@"..B.Name..")",R+1;
                O[t]=K;
                i[K]=h;
                Y[h]=K;
                M[h]=true;
                R=t;
            else
            end;
        else
        end;
    else
    end;
else
end;
end;
for h=#O,R+1,-1 do
    O[h]=nil;
end;
table.sort(O,A);
I={};
for h in G,nil,nil do
    if M[h]then
        I[#I+1]=Y[h];
    else
        G[h]=nil;
    end;
end;
if m then
    x=true;
    pcall(m.setvalues,m,O);
    pcall(m.set,m,I);
    x=false;
end;
end;
p.bind=function(h)m=h;
end;
p.unload=function()m,x=nil,false;
table.clear(G);
table.clear(i);
table.clear(Y);
table.clear(O);
end;
j.connect(S:GetAttributeChangedSignal("Gamemode"),function()p.refresh();
end);
j.connect(o.PlayerAdded,function()p.refresh();
end);
j.connect(o.PlayerRemoving,function(m)G[m.UserId]=nil;
p.refresh(m);
end);
j.teardown(p.unload);
return p;
end;

D.an=function()local m,j,h,b=D.load("b"),D.load("f"),D.load("a"),D.load("h");
local K,S,o,t=D.load("j"),D.load("L"),D.load("ai"),D.load("ag");
local G=D.load("ah");
local i=D.load("aj");
local Y=D.load("am");
local O=D.load("ak");
local T=D.load("p");
local x=D.load("M");
local p=m.lp;
local A=m.workspace;
local m=S.probe;
local M=S.through;
local a=K.ray_ignore;
local K=o.groups;
local B=o.order;
local N=o.damage_key;
local I=o.size_key;
local o=j.trim;
local j=math.clamp;
local R=math.max;
local n,n,n=math.min,math.abs,math.huge;
local E=math.cos;
local d=math.rad;
local w,w=math.floor,Vector3.zero;
local P,r=Vector3.yAxis,{};
local L=RaycastParams.new();
L.FilterType=Enum.RaycastFilterType.Exclude;
L.IgnoreWater=false;
L.CollisionGroup="Bullet";
local Z,X,q,U,z,J,y={};
local f,k,g,Q,c,H,_,s,F,v,u,V,e,l,C,W,mF,DF,jF,hF,bF,KF,SF,oF,tF={},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{};
local function GF(iF)local YF=SF[iF];
if YF~=nil then
    return YF,oF[iF];
end;
local YF,OF=G.effective_armor(iF);
SF[iF]=YF;
oF[iF]=OF;
return YF,OF;
end;
local function G(iF,YF,OF,TF,xF)local pF=N[YF];
if not(pF)then
    return 0,0;
end;
YF=xF.DamagePerPart;
if type(YF)~="table"then return 0,0;
end;
local AF=YF[pF]or 0;
if AF<=0 then
    return 0,0;
end;
YF=AF*(tonumber(xF.RangeModifier)or 1)^R(0,OF/100);
YF=if TF>0 then
    YF*(tonumber(xF.WallbangMultiplier)or 1)
else
    YF;
    AF,TF=GF(iF);
    iF=0;
    if AF>0 and(pF~="Head"or TF)then
        OF=YF*j(tonumber(xF.ArmorPenetration)or 1,0,1);
        iF=(YF-OF)*0.5;
        if iF>AF then
            iF,OF=AF,YF-AF/0.5;
        else
        end;
        YF=(R(0,OF));
    else
    end;
    return YF,iF;
end;
local function GF(iF,YF,OF)local TF=N[iF];
if not(TF)then
    return 0;
end;
iF=OF.DamagePerPart;
if type(iF)~="table"then return 0;
end;
local N=iF[TF]or 0;
if type(N)~="number"then return n;
end;
if N<=0 then
    return 0;
end;
TF=tonumber(OF.RangeModifier)or 1;
if TF~=TF then
    return n;
elseif  TF<0 then
    return n;
elseif  TF>1 then
    return n;
end;
if YF then
    iF=tonumber(OF.WallbangMultiplier)or 1;
    if iF~=iF then
        return n;
    elseif  iF<0 then
        return n;
    end;
    return N*iF;
end;
return N;
end;
local function N(iF,YF,OF)local TF=t.min_damage;
if tF then
    local xF=G(iF,tF,YF,0,OF);
    if xF>0 then
        if xF<TF then
            return xF;
        end;
    end;
end;
return TF;
end;
local function iF(YF)return(x.origin(YF));
end;
local function x(YF,OF,TF)local xF=j(tonumber(TF)or 0,0,100)/100;
if xF<=0 then
    return 0;
end;
TF=YF.Size;
local pF,AF,MF,aF,BF=R(TF.X*0.5-0.05,0)*xF,R(TF.Y*0.5-0.05,0)*xF,R(TF.Z*0.5-0.05,0)*xF,YF.CFrame,0;
if OF=="head"or OF=="chest"or OF=="stomach"then if pF>0.001 then
    mF[1]=aF:PointToWorldSpace(Vector3.new(pF,0,0));
    BF=2;
    mF[BF]=aF:PointToWorldSpace(Vector3.new(-pF,0,0));
else
end;
if AF>0.001 then
    BF+=1;
    mF[BF]=aF:PointToWorldSpace(Vector3.new(0,AF,0));
    BF+=1;
    mF[BF]=aF:PointToWorldSpace(Vector3.new(0,-AF,0));
else
end;
else
    YF=if AF>=pF and AF>=MF then
        Vector3.new(0,AF,0)
    else
        if pF>=MF then
            Vector3.new(pF,0,0)
        else
            Vector3.new(0,0,MF);
            if YF.Magnitude>0.001 then
                mF[1]=aF:PointToWorldSpace(YF);
                mF[2]=aF:PointToWorldSpace(-YF);
                BF=2;
            else
            end;
        end;
        for YF=BF+1,4,1 do
            mF[YF]=nil;
        end;
        return BF;
    end;
    local function YF(OF,TF,xF,pF,AF,MF)local aF=OF-TF;
    OF=aF.Magnitude;
    if OF<0.5 then
        return nil;
    elseif  OF>MF+5 then
        return nil;
    end;
    TF=aF/OF;
    if pF<180 then
        if xF:Dot(TF)<AF then
            return nil;
        end;
    end;
    return TF,OF;
end;
local function OF(TF,xF)local pF,AF,MF,aF,BF=not not xF.head,not not xF.chest,not not xF.stomach,not not xF.arms,not not xF.legs;
if X==TF then
    if q==pF then
        if U==AF then
            if z==MF then
                if J==aF then
                    if y==BF then
                        return Z;
                    end;
                end;
            end;
        end;
    end;
end;
X,q,U,z,J,y=TF,pF,AF,MF,aF,BF;
pF,aF={},0;
if xF[TF]then
    aF=1;
    pF[aF]=TF;
else
end;
for q=1,#B,1 do
    BF=B[q];
    if BF~=TF then
        if xF[BF]then
            q=aF+1;
            pF[q]=BF;
            aF=q;
        else
        end;
    else
    end;
end;
if aF==0 then
    pF[1]=TF;
    aF=1;
    for q=1,#B,1 do
        MF=B[q];
        if MF~=TF then
            aF+=1;
            pF[aF]=MF;
        else
        end;
    end;
else
end;
AF=0;
for B=1,aF,1 do
    TF=pF[B];
    MF=K[TF];
    Z[B]={group=TF,parts=MF,slot=AF};
    AF+=#MF;
end;
o(Z,aF);
return Z;
end;
local function K(B,q,U,z,J,y,TF,xF)local pF,AF,MF=#f,b.all();
local b,aF=0,false;
for BF=1,MF,1 do
    local MF=AF[BF];
    local AF=T.target(MF);
    if AF~=TF then
        local TF,NF=i.valid(MF,AF);
        if TF then
            local TF=NF.Position-B;
            local B=TF.Magnitude;
            if B>0.5 then
                if B-4<=J then
                    local J=U>=180;
                    J=J or(if B>0.01 then
                        q:Dot(TF/B)>=z
                    else
                        J);
                        if J then
                        else
                            if xF then
                                if xF>0 then
                                    local B=O.offset(AF,xF);
                                    if B.X~=0 or B.Y~=0 or B.Z~=0 then
                                        local U=TF+B;
                                        local B=U.Magnitude;
                                        J=if B>0.01 then
                                            q:Dot(U/B)>=z
                                        else
                                            J;
                                        else
                                        end;
                                    else
                                    end;
                                else
                                end;
                            end;
                            if J then
                                local B=b+1;
                                f[B]=MF;
                                k[B]=AF;
                                g[B]=BF;
                                Q[B]=T.ghost(AF);
                                aF=if y then
                                    if Y.picked[MF.UserId]then
                                        true
                                    else
                                        aF
                                    else
                                        aF;
                                        b=B;
                                    else
                                    end;
                                else
                                end;
                            else
                            end;
                        else
                        end;
                    else
                    end;
                end;
                for T=b+1,pF,1 do
                    f[T]=nil;
                    k[T]=nil;
                    g[T]=nil;
                    Q[T]=nil;
                end;
                return b,aF;
            end;
            local function b(T,B,q,U)table.clear(DF);
            table.clear(jF);
            table.clear(hF);
            table.clear(bF);
            table.clear(KF);
            tF=nil;
            local z,J=#T,0;
            for y=1,z,1 do
                local TF=T[y].parts;
                y=#TF;
                for xF=1,y,1 do
                    local y=TF[xF];
                    xF=GF(y,false,B);
                    if xF>J then
                        if xF<n then
                            tF,J=y,xF;
                        else
                        end;
                    else
                    end;
                end;
            end;
            z=t.min_damage;
            z=if tF then
                if J<z then
                    J
                else
                    z
                else
                    z;
                    for J=1,#T,1 do
                        local y=T[J];
                        local tF,TF,xF=y.group==q and 1000000 or 0,-n,y.parts;
                        for q=1,#xF,1 do
                            y=xF[q];
                            local xF,pF=GF(y,false,B),-n;
                            pF=if xF>=z then
                                xF+tF+100000
                            else
                                pF;
                                q=-n;
                                if U then
                                    if t.magic then
                                    else
                                        local U,AF=if xF>=z then
                                            xF+tF
                                        else
                                            q,GF(y,true,B);
                                            q=if AF>=t.wall_min_damage then
                                                R(U,AF+tF)
                                            else
                                                U;
                                            end;
                                        else
                                        end;
                                        DF[y]=pF;
                                        jF[y]=q;
                                        hF[y]=R(pF,q);
                                        TF=R(TF,hF[y]);
                                    end;
                                    bF[J]=TF;
                                end;
                                B=-n;
                                for q=#T,1,-1 do
                                    B=R(B,bF[q]);
                                    KF[q]=B;
                                end;
                            end;
                            local function T(B,q,U,z,J,y)local tF=M(B,q,U,z,J,y);
                            if tF then
                                if#tF==0 then
                                    return nil;
                                end;
                            else
                                return nil;
                            end;
                            y=0;
                            for M=1,#tF,1 do
                                z=tF[M];
                                if z.instance then
                                    if z.instance:IsDescendantOf(J)then
                                        return z,y,tF,M;
                                    end;
                                    y=if M%2~=0 then
                                        y+1
                                    else
                                        y;
                                    else
                                    end;
                                end;
                                return nil;
                            end;
                            local function M(B,q,U)local z=q.Magnitude;
                            if z<0.25 then
                                return nil;
                            end;
                            local J=m(B,q,L,U);
                            if not(J.instance)then
                                return B+q;
                            end;
                            U=(J.position-B).Magnitude-0.3;
                            if U<0.25 then
                                return nil;
                            end;
                            return B+q*(U/z);
                        end;
                        local function B(q,U,z,J,y)local tF,GF=(q-1)*5,W[q];
                        if GF then
                            return tF,GF;
                        end;
                        local TF=Vector3.new(z.X-U.X,0,z.Z-U.Z);
                        z=nil;
                        if TF.Magnitude>0.001 then
                            TF=TF.Unit;
                            z=Vector3.new(-TF.Z,0,TF.X);
                        else
                            z=w;
                        end;
                        TF=y*0.5;
                        GF=0;
                        for xF=1,5,1 do
                            local pF=M(U,if xF==1 then
                                z*TF
                            else
                                if xF==2 then
                                    z*-TF
                                else
                                    if xF==3 then
                                        z*y
                                    else
                                        if xF==4 then
                                            z*-y
                                        else
                                            P*y,J);
                                            if pF then
                                                xF=true;
                                                for M=1,GF,1 do
                                                    if(C[tF+M]-pF).Magnitude<0.2 then
                                                        xF=false;
                                                        break;
                                                    end;
                                                end;
                                                if xF then
                                                    GF+=1;
                                                    C[tF+GF]=pF;
                                                else
                                                end;
                                            else
                                            end;
                                        end;
                                        W[q]=GF;
                                        return tF,GF;
                                    end;
                                    S={find=function(M,P,q,U)if not(t.on)then
                                        return nil;
                                    end;
                                    if M then
                                        if M.Class~="Weapon"then return nil;
                                    end;
                                else
                                    return nil;
                                end;
                                local z=A.CurrentCamera;
                                if not(z)then
                                    return nil;
                                end;
                                if not(i.alive(p.Character))then
                                    return nil;
                                end;
                                local p,A,J=P or iF(z)or z.CFrame.Position,z.CFrame.LookVector,j(t.fov,0,180);
                                local y,tF,GF,iF=E(d(J/2)),tonumber(M.Range)or 500,t.auto_wall or t.wallbang,R(tonumber(M.Penetration)or 0,0);
                                P,z=GF and iF or nil,t.prefer;
                                local R,E,d,TF,xF=OF(z,t.boxes),a(),O.lead(),0,t.magic and 0 or j(tonumber(t.origin_shift)or 0,0,20);
                                local j,a,OF=xF>=0.25,K(p,A,J,y,tF,q==true,U,d);
                                if a==0 then
                                    return nil;
                                end;
                                table.clear(SF);
                                table.clear(oF);
                                table.clear(W);
                                b(R,M,z,GF);
                                local b,K,pF,AF,MF,aF,BF,NF,IF,RF,nF,EF,dF,wF,PF,rF,LF,ZF,XF,qF=-1,-n,n;
                                q,U=0,0;
                                for UF=1,#R,1 do
                                    local zF=R[UF];
                                    if OF then
                                        if b==1 then
                                            if K>KF[UF]then
                                                break;
                                            end;
                                        end;
                                    elseif  K>KF[UF]then
                                        break;
                                    end;
                                    UF=zF.group;
                                    local JF,yF=UF==z and 1000000 or 0,zF.parts;
                                    local fF=0;
                                    for kF=1,a,1 do
                                        local gF,QF,cF,HF=f[kF],k[kF],g[kF],Q[kF];
                                        local _F=OF and Y.picked[gF.UserId]and 1 or 0;
                                        for sF=1,#yF,1 do
                                            local FF=yF[sF];
                                            local vF=hF[FF];
                                            if vF>-n and _F>=b and(_F>b or not(K>vF))then
                                                local vF=i.part(QF,FF);
                                                if vF then
                                                    local uF=vF.Position;
                                                    local VF=uF-p;
                                                    local eF=VF.Magnitude;
                                                    if eF>=0.5 and eF<=tF+5 then
                                                        local lF,CF,WF,m7=VF/eF,cF*100+zF.slot+sF,false,false;
                                                        if t.magic then
                                                            local cF,sF=G(gF,vF.Name,eF,0,M);
                                                            if cF>=N(gF,eF,M)then
                                                                local VF=cF+JF+100000;
                                                                if _F>b or _F==b and(VF>K or VF==K and CF<pF)then
                                                                    b,K,pF,AF,MF,aF,BF,NF,IF,RF,nF,EF,dF,wF,PF,rF,LF,ZF,XF,qF=_F,VF,CF,gF,QF,vF,UF,cF,sF,true,lF,vF,uF,-lF,vF.Material,0,nil,nil,eF,p;
                                                                else
                                                                end;
                                                            else
                                                            end;
                                                        else
                                                            if HF then
                                                                local cF,sF=O.hit(p,lF,vF,w,eF);
                                                                local VF=cF or eF;
                                                                local D7,j7,h7,b7=O.path(p,lF,VF,P,O.filter(E,QF));
                                                                if D7~=2 then
                                                                    local D7,K7=G(gF,FF,VF,j7,M);
                                                                    if D7>=(j7>0 and t.wall_min_damage or N(gF,VF,M))then
                                                                        cF=D7+JF+(j7==0 and 100000 or 0);
                                                                        if _F>b or _F==b and(cF>K or cF==K and CF<pF)then
                                                                            b,K,pF,AF,MF,aF,BF,NF,IF,RF,nF,EF,dF,wF,PF,rF,LF,ZF,XF,qF=_F,cF,CF,gF,QF,vF,UF,D7,K7,j7==0,lF,vF,p+lF*VF,sF or-lF,vF.Material,j7,h7,b7,VF,p;
                                                                        else
                                                                        end;
                                                                    else
                                                                    end;
                                                                else
                                                                end;
                                                            else
                                                                local cF=m(p,lF*tF,L,E);
                                                                local sF=cF and cF.instance;
                                                                if sF and(sF:IsDescendantOf(QF))then
                                                                    m7=true;
                                                                    local VF=(cF.position-p).Magnitude;
                                                                    local D7,j7=G(gF,sF.Name,VF,0,M);
                                                                    if D7>=N(gF,VF,M)then
                                                                        WF=true;
                                                                        local h7=D7+JF+100000;
                                                                        if _F>b or _F==b and(h7>K or h7==K and CF<pF)then
                                                                            dF,wF=cF.position,cF.normal or w;
                                                                            b,K,pF,AF,MF,aF,BF,NF,IF,RF,nF,EF,PF,rF,LF,ZF,XF,qF=_F,h7,CF,gF,QF,vF,UF,D7,j7,true,lF,sF,cF.material,0,nil,nil,VF,p;
                                                                        else
                                                                        end;
                                                                    else
                                                                    end;
                                                                else
                                                                    if GF and sF and(_F>b or not(K>jF[FF]))then
                                                                        fF+=1;
                                                                        c[fF]=gF;
                                                                        H[fF]=QF;
                                                                        _[fF]=vF;
                                                                        s[fF]=lF;
                                                                        F[fF]=eF;
                                                                        v[fF]=CF;
                                                                        u[fF]=jF[FF];
                                                                        V[fF]=false;
                                                                        e[fF]=p;
                                                                        l[fF]=0;
                                                                    else
                                                                    end;
                                                                end;
                                                            end;
                                                        end;
                                                        if t.multipoint and not WF and not t.magic and not HF and q<40 then
                                                            lF=I[UF];
                                                            for I=1,x(vF,UF,lF and t[lF]or 0),1 do
                                                                if q>=40 then
                                                                    break;
                                                                end;
                                                                local x=mF[I];
                                                                local cF,sF=YF(x,p,A,J,y,tF);
                                                                if cF then
                                                                    q+=1;
                                                                    local YF,VF=CF+I/1000,m(p,cF*tF,L,E);
                                                                    x=VF and VF.instance;
                                                                    if x and(x:IsDescendantOf(QF))then
                                                                        m7=true;
                                                                        local I=(VF.position-p).Magnitude;
                                                                        local eF,WF=G(gF,x.Name,I,0,M);
                                                                        if eF>=N(gF,I,M)then
                                                                            local D7=eF+JF+100000;
                                                                            if _F>b or _F==b and(D7>K or D7==K and YF<pF)then
                                                                                dF,wF=VF.position,VF.normal or w;
                                                                                b,K,pF,AF,MF,aF,BF,NF,IF,RF,nF,EF,PF,rF,LF,ZF,XF,qF=_F,D7,YF,gF,QF,vF,UF,eF,WF,true,cF,x,VF.material,0,nil,nil,I,p;
                                                                            else
                                                                            end;
                                                                        else
                                                                        end;
                                                                    else
                                                                        if GF and x and(_F>b or not(K>jF[FF]))then
                                                                            fF+=1;
                                                                            c[fF]=gF;
                                                                            H[fF]=QF;
                                                                            _[fF]=vF;
                                                                            s[fF]=cF;
                                                                            F[fF]=sF;
                                                                            v[fF]=YF;
                                                                            u[fF]=jF[FF];
                                                                            V[fF]=true;
                                                                            e[fF]=p;
                                                                            l[fF]=0;
                                                                        else
                                                                        end;
                                                                    end;
                                                                else
                                                                end;
                                                            end;
                                                        else
                                                        end;
                                                        if j and not m7 and not HF and(_F>b or not(K>DF[FF]))then
                                                            local x,I=B(kF,p,uF,E,xF);
                                                            for B=1,I,1 do
                                                                lF=C[x+B];
                                                                local x=uF-lF;
                                                                local I=x.Magnitude;
                                                                if I>=0.5 then
                                                                    if I<=tF+5 then
                                                                        local YF=x/I;
                                                                        local x=m(lF,YF*(I+5),L,E);
                                                                        local m,L=x.instance,CF+0.5+B/100;
                                                                        if m and(m:IsDescendantOf(QF))then
                                                                            local kF=(x.position-lF).Magnitude;
                                                                            local cF,HF=G(gF,m.Name,kF,0,M);
                                                                            if cF>=N(gF,kF,M)then
                                                                                local sF=cF+JF+100000-B*0.01;
                                                                                if _F>b or _F==b and(sF>K or sF==K and L<pF)then
                                                                                    local uF,VF=true,x.position;
                                                                                    wF=x.normal or w;
                                                                                    local eF,CF,WF,m7=x.material,0;
                                                                                    b,K,pF,AF,MF,aF,BF,NF,IF,RF,nF,EF,dF,PF,rF,LF,ZF,XF,qF=_F,sF,L,gF,QF,vF,UF,cF,HF,uF,YF,m,VF,eF,CF,WF,m7,kF,lF;
                                                                                else
                                                                                end;
                                                                            else
                                                                            end;
                                                                            break;
                                                                        elseif  GF and m and(_F>b or not(K>jF[FF]))then
                                                                            local m=fF+1;
                                                                            c[m]=gF;
                                                                            H[m]=QF;
                                                                            _[m]=vF;
                                                                            s[m]=YF;
                                                                            F[m]=I;
                                                                            v[m]=L;
                                                                            u[m]=jF[FF];
                                                                            V[m]=true;
                                                                            e[m]=lF;
                                                                            l[m]=B*0.01;
                                                                            fF=m;
                                                                        else
                                                                        end;
                                                                    else
                                                                    end;
                                                                else
                                                                end;
                                                            end;
                                                        else
                                                        end;
                                                    else
                                                    end;
                                                else
                                                end;
                                            else
                                            end;
                                        end;
                                    end;
                                    for m=1,fF,1 do
                                        zF=c[m];
                                        yF=OF and Y.picked[zF.UserId]and 1 or 0;
                                        local x,B=yF>=b and(yF>b or not(K>u[m]));
                                        if x then
                                            local I=V[m];
                                            B=if I then
                                                U<8
                                            else
                                                not I;
                                            else
                                                B=x;
                                            end;
                                            if B then
                                                U=if V[m]then
                                                    U+1
                                                else
                                                    U;
                                                    local B,I,L=H[m],s[m],e[m]or p;
                                                    local YF,kF,gF,QF=T(L,I,iF,E,B,F[m]);
                                                    x=YF and YF.instance;
                                                    if x then
                                                        local T=(YF.position-L).Magnitude;
                                                        local cF,HF=G(zF,x.Name,T,kF,M);
                                                        if cF>=(kF>0 and t.wall_min_damage or N(zF,T,M))then
                                                            local _F,sF=v[m],cF+JF-(l[m]or 0);
                                                            if yF>b or yF==b and(sF>K or sF==K and _F<pF)then
                                                                aF,dF,wF=_[m],YF.position,YF.normal or w;
                                                                b,K,pF,AF,MF,BF,NF,IF,RF,nF,EF,PF,rF,LF,ZF,XF,qF=yF,sF,_F,zF,B,UF,cF,HF,false,I,x,YF.material,kF,gF,QF,T,L;
                                                            else
                                                            end;
                                                        else
                                                        end;
                                                    else
                                                    end;
                                                else
                                                end;
                                            end;
                                            for m=1,fF,1 do
                                                c[m]=nil;
                                                H[m]=nil;
                                                _[m]=nil;
                                                s[m]=nil;
                                                F[m]=nil;
                                                v[m]=nil;
                                                u[m]=nil;
                                                V[m]=nil;
                                                e[m]=nil;
                                                l[m]=nil;
                                            end;
                                        end;
                                        if O.on and d~=0 and not aF then
                                            J,iF=#R,0;
                                            for m=1,a,1 do
                                                if iF>=12 then
                                                    break;
                                                end;
                                                y,GF=f[m],k[m];
                                                U=OF and Y.picked[y.UserId]and 1 or 0;
                                                if U>=b then
                                                    A=O.offset(GF,d);
                                                    if A.X~=0 or A.Y~=0 or A.Z~=0 then
                                                        j=g[m];
                                                        for m=1,J,1 do
                                                            if iF>=12 then
                                                                break;
                                                            end;
                                                            if U>b or not(K>KF[m])then
                                                                xF=R[m];
                                                                q=xF.group;
                                                                local m,Y=q==z and 1000000 or 0,xF.parts;
                                                                for T=1,#Y,1 do
                                                                    local x=Y[T];
                                                                    if hF[x]>-n then
                                                                        local Y=i.part(GF,x);
                                                                        if Y and(Y:IsA("BasePart"))then
                                                                            iF+=1;
                                                                            local B=Y.Position+A-p;
                                                                            local I=B.Magnitude;
                                                                            if I>0.5 and I<=tF+5 then
                                                                                local n=B/I;
                                                                                local B,L=O.hit(p,n,Y,A,I);
                                                                                local YF,UF,zF,JF,yF=B or I,0,0;
                                                                                local I,fF=LF,ZF;
                                                                                if t.magic then
                                                                                    LF,ZF=JF,yF;
                                                                                else
                                                                                    UF,zF,LF,ZF=O.path(p,n,YF,P,O.filter(E,GF));
                                                                                end;
                                                                                JF,B=G(y,x,YF,zF,M);
                                                                                yF=zF>0 and t.wall_min_damage or N(y,YF,M);
                                                                                if UF~=2 and JF>=yF then
                                                                                    local x,UF=JF+m,j*100+xF.slot+T;
                                                                                    if U>b or U==b and(x>K or x==K and UF<pF)then
                                                                                        b,K,pF,AF,MF,aF,BF,NF,IF,RF,nF,EF,dF,wF,PF,rF,XF,qF,TF=U,x,UF,y,GF,Y,q,JF,B,zF==0,n,Y,p+n*YF,L or-n,Y.Material,zF,YF,p,d;
                                                                                    else
                                                                                        LF,ZF=I,fF;
                                                                                    end;
                                                                                else
                                                                                    LF,ZF=I,fF;
                                                                                end;
                                                                            else
                                                                            end;
                                                                            break;
                                                                        end;
                                                                    end;
                                                                end;
                                                            else
                                                            end;
                                                        end;
                                                    else
                                                    end;
                                                else
                                                end;
                                            end;
                                        else
                                        end;
                                        if aF then
                                            if i.valid(AF,MF)then
                                                if not(aF:IsDescendantOf(MF))then
                                                    return nil;
                                                end;
                                            else
                                                return nil;
                                            end;
                                        else
                                            return nil;
                                        end;
                                        if O.on and d>0 and TF==0 and aF:IsA("BasePart")then
                                            U=O.offset(MF,d);
                                            if U.X~=0 or U.Y~=0 or U.Z~=0 then
                                                a=typeof(qF)=="Vector3"and qF or p;
                                                j=aF.Position+U-a;
                                                GF=j.Magnitude;
                                                if GF>0.5 and GF<=tF+5 then
                                                    q=j/GF;
                                                    R,z=O.hit(a,q,aF,U,GF);
                                                    y,J,iF,xF,A=R or GF,0,0;
                                                    local m,b=LF,ZF;
                                                    if t.magic then
                                                        LF,ZF=xF,A;
                                                    else
                                                        J,iF,LF,ZF=O.path(a,q,y,P,O.filter(E,MF));
                                                    end;
                                                    local K,i=G(AF,aF.Name,y,iF,M);
                                                    OF=iF>0 and t.wall_min_damage or N(AF,y,M);
                                                    if J~=2 and K>=OF then
                                                        TF,NF,IF,RF,nF,EF,dF,wF,PF,rF,XF,qF=d,K,i,iF==0,q,aF,a+q*y,z or-q,aF.Material,iF,y,a;
                                                    else
                                                        LF,ZF=m,b;
                                                    end;
                                                else
                                                end;
                                            else
                                            end;
                                        else
                                        end;
                                        d=nil;
                                        if LF then
                                            d={};
                                            j=0;
                                            for m=1,ZF-1,1 do
                                                J=LF[m];
                                                if J then
                                                    if J.instance then
                                                        A=j+1;
                                                        d[A]={Position=J.position,Instance=J.instance,Material=J.material and J.material.Name or"Plastic",Normal=J.normal or w,Exit=m%2==0};
                                                        j=A;
                                                    else
                                                    end;
                                                else
                                                end;
                                            end;
                                        else
                                            d=r;
                                        end;
                                        return{player=AF,char=MF,part=aF,shot={visible=RF,dir=nF,hit_part=EF,hit_pos=dF,normal=wF,material=PF,walls=rF,wall_hits=d,dist=XF,origin=qF},dmg=NF,armor_dmg=IF or 0,group=BF,lead=TF};
                                    end
                                };
                                h.teardown(function()o(f,0);
                                o(k,0);
                                o(g,0);
                                o(Q,0);
                                o(c,0);
                                o(H,0);
                                o(_,0);
                                o(s,0);
                                o(F,0);
                                o(v,0);
                                o(u,0);
                                o(V,0);
                                o(e,0);
                                o(l,0);
                                o(C,0);
                                table.clear(W);
                                o(mF,0);
                                o(Z,0);
                                table.clear(DF);
                                table.clear(jF);
                                table.clear(hF);
                                table.clear(bF);
                                table.clear(KF);
                                table.clear(SF);
                                table.clear(oF);
                                X=nil;
                            end);
                            return S;
                        end;

D.l=function()local j,h=D.load("b"),D.load("a");
            local b=j.storage;
            local K=math.clamp;
            local S=Vector3.new;
            local o,t=Vector3.one,{"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot"};
            local G=Instance.new("Folder");
            h.own(G);
            local i={};
            local Y=j.weak();
            local j={names=t,owners=Y};
            local function O(T)local x=T:FindFirstChild("HumanoidRootPart");
            if x then
                if not(x:IsA("BasePart"))then
                    return nil;
                end;
            else
                return nil;
            end;
            local p,A,M,a=x.CFrame:Inverse(),{},{},0;
            for B=1,#t,1 do
                local N=t[B];
                B=T:FindFirstChild(N);
                if B then
                    if B:IsA("BasePart")then
                        A[N]=p*B.CFrame;
                        M[N]=B.Size;
                        a+=1;
                    else
                    end;
                else
                end;
            end;
            if a<8 then
                return nil;
            end;
            return{off=A,size=M,root=x.Size};
        end;
        j.grab=O;
        local function T(x)local p={};
        for A,M in x.off,nil,nil do
            p[A]=M-S(0,1.35*K((M.Position.Y+3)/4.4,0,1),0);
        end;
        return{off=p,size=x.size,root=x.root};
    end;
    j.kit=function(K)if type(K)~="string"then return nil;
end;
local x=i[K];
if x~=nil then
    return x or nil;
end;
x=b:FindFirstChild("Assets");
x=x and(x:FindFirstChild("Characters"));
local b=x and(x:FindFirstChild(K));
x=b and O(b)or nil;
i[K]=x or false;
return x;
end;
j.learn=function(b,K,x,p)local A=x and"duck"or"stand";
if b.stance~=A then
    b.stance=A;
    b.since=p;
    return;
end;
if p-(b.since or 0)<0.35 then
    return;
elseif  p-(b.learnt or 0)<0.25 then
    return;
end;
x=O(K);
if x then
    b.learnt=p;
    b[A]=x;
end;
end;
j.pick=function(b,K)if K then
    if b.duck then
        return b.duck;
    end;
end;
local x=b.stand;
if x==nil then
    local p=b.plr.Character;
    x=p and p.Parent and p:GetAttribute("Dead")~=true and O(p)or false;
    b.stand=x;
else
end;
x=x or j.kit(j.look(b.plr));
if not(x)then
    return b.duck;
end;
if not(K)then
    return x;
end;
K=x.low;
if K then
else
    K=T(x);
    x.low=K;
end;
return K;
end;
local function b(K,O,T)local x=Instance.new("Part");
x.Name=K;
x.Size=O;
x.Anchored=true;
x.CanCollide=false;
x.CanQuery=false;
x.CanTouch=false;
x.CastShadow=false;
x.Massless=true;
x.Transparency=1;
x.Parent=T;
return x;
end;
j.look=function(K)return K:GetAttribute("PresentationCharacterName")or K:GetAttribute("CharacterName");
end;
j.ghost=function(K,O)local T,x=j.look(K.plr)or"?",K.ghost;
if x and x.key==T and x.model.Parent==G then
    if x.src~=O.size then
        x.src=O.size;
        for p,A in x.parts,nil,nil do
            local M=O.size[p];
            if M then
                if A.Size~=M then
                    A.Size=M;
                end;
            end;
        end;
    end;
    return x;
end;
if x then
    Y[x.model]=nil;
    pcall(x.model.Destroy,x.model);
end;
local p=Instance.new("Model");
p.Name=K.plr.Name;
local A,M=b("HumanoidRootPart",O.root or S(2,2,1),p),{};
for S=1,#t,1 do
    local a=t[S];
    M[a]=b(a,O.size[a]or o,p);
end;
p.PrimaryPart=A;
p:SetAttribute("CharacterType","PlayerCustomCharacter");
p:SetAttribute("Dead",false);
p.Parent=G;
x={model=p,root=A,parts=M,key=T,src=O.size};
K.ghost=x;
Y[p]=K.plr;
return x;
end;
j.place=function(b,K,S)b.root.CFrame=S;
local o=K.off;
for t,G in b.parts,nil,nil do
    K=o[t];
    if K then
        G.CFrame=S*K;
    end;
end;
end;
j.mirror=function(b,K)local S,o=b.model,K:GetAttribute("Health");
if b.hp~=o then
    b.hp=o;
    S:SetAttribute("Health",o);
end;
o=K:GetAttribute("MaxHealth");
if b.cap~=o then
    b.cap=o;
    S:SetAttribute("MaxHealth",o);
end;
end;
j.drop=function(b)local K=b.ghost;
b.ghost=nil;
if K then
    Y[K.model]=nil;
    pcall(K.model.Destroy,K.model);
end;
end;
h.teardown(function()table.clear(i);
end);
return j;
end;

D.A=function()local j,h=D.load("b"),D.load("s");
        local b=D.load("x");
        local K=j.guiservice;
        local j=getgenv();
        local S=math.tan;
        local o=math.rad;
        local t=math.min;
        local G=table.clear;
        local i=CFrame.fromMatrix;
        local Y,O=CFrame.identity.PointToObjectSpace,{};
        O.__index=O;
        O.new=function(T,x)return setmetatable({plr=T,itf=x,ph=math.random(),char=nil,en=false,fr=false,onSc=false,dis=0,corn=nil,charCache={},cacheValid=false,links={},skpts=nil,dir=nil,viewport=nil,activeCam=nil,indicators=nil,hp=0,maxHp=100,arm=0,wep="",mon=0,pn=0,_hd=nil,_quiet=false,_cornT={},_cornPts={},_arSnap=true},O);
    end;
    O.project=function(T,x)local p,A=T.viewport,T.activeCam;
    if p then
        T=p.AbsoluteSize;
        if T.X<1 then
            return Vector2.zero,false,0;
        elseif  T.Y<1 then
            return Vector2.zero,false,0;
        end;
        local M=A.CFrame:PointToObjectSpace(x);
        if M.Z>-0.05 then
            return Vector2.zero,false,0;
        end;
        local a,B=S(o((A.FieldOfView or 70)*0.5)),-M.Z;
        local S,o,N=M.X/(B*a*(T.X/T.Y)),M.Y/(B*a),p.AbsolutePosition+K:GetGuiInset();
        return Vector2.new(N.X+T.X*(0.5+S*0.5),N.Y+T.Y*(0.5-o*0.5)),true,B;
    end;
    if h.overridden()then
        return h.project_view(x);
    end;
    local K,S=A:WorldToViewportPoint(x);
    return Vector2.new(K.X,K.Y),S,K.Z;
end;
O.drop_events=function(K)local S=K.links;
local K,o=S.added,S.removed;
if K then
    pcall(K.Disconnect,K);
    S.added=nil;
end;
if o then
    pcall(o.Disconnect,o);
    S.removed=nil;
end;
end;
local function K(S,o)if h.body_parts[o.Name]then
    S.cacheValid=false;
end;
end;
O.watch=function(S,o)S:drop_events();
if not(o)then
    return;
end;
local T=S.links;
T.added=o.ChildAdded:Connect(function(x)K(S,x);
end);
T.removed=o.ChildRemoved:Connect(function(o)K(S,o);
end);
end;
O.validate=function(K)local S=K.char;
if S then
    if S.Parent then
        if K.cacheValid==false then
            return false;
        end;
    else
        return false;
    end;
else
    return false;
end;
local o=K.charCache;
K=#o;
if K==0 then
    return false;
end;
for T=1,t(3,K),1 do
    local K=o[T];
    if K then
        if K.Parent then
            if K.Parent~=S then
                return false;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
return true;
end;
O.rebuild=function(K)local S=K.charCache;
if K.char then
    if not(K.char.Parent)then
        G(S);
        return;
    end;
else
    G(S);
    return;
end;
h.char_parts(K.char,S);
K.cacheValid=true;
end;
O.update=function(K)local S=K.itf;
local o=b.shared_for(S,K.plr);
local t=o.opt;
K.opt=t;
K.indicators=nil;
K._quiet=false;
local T=K.plr;
if if T then
    not K.plr.Parent
else
    not T then
        K.en=false;
        K.char=nil;
        K.onSc=false;
        G(K.charCache);
        K.cacheValid=false;
        K.skpts=nil;
        K._hd=nil;
        K:drop_events();
        return;
    end;
    T=o.char;
    if T~=K.char then
        K.char=T;
        G(K.charCache);
        K.cacheValid=false;
        K.cacheChar=nil;
        K.skpts=nil;
        K.dir=nil;
        K._hd=nil;
        K._arSnap=true;
        K:watch(T);
    end;
    K.en=o.en;
    K.fr=o.fr;
    if not(K.en)then
        K.onSc=false;
        K.cacheValid=false;
        K.skpts=nil;
        return;
    end;
    T=K._hd;
    if if T then
        T.Parent~=K.char
    else
        not T then
            T=K.char and K.char:FindFirstChild("Head")or nil;
            K._hd=T;
        else
        end;
        if if T then
            not T.Parent
        else
            not T then
                G(K.charCache);
                K.cacheValid=false;
                K.skpts=nil;
                K.onSc=false;
                return;
            end;
            local x,p=h.camera(),o.clone;
            local A=p and p.viewport;
            if A then
                if not(rawget(j,"VISUALS_TAB_OPEN"))then
                    K.onSc=false;
                    return;
                end;
                x=A.CurrentCamera or x;
            else
            end;
            K.viewport=A;
            K.activeCam=x;
            local j,M,a=K:project(T.Position);
            local B=S.shSet;
            local N=B.limDis and a>B.maxDis;
            K.onSc=M and not N;
            K.dis=((h.overridden()and h.view_frame().Position or x.CFrame.Position)-T.Position).Magnitude;
            M=h.viewport();
            if A then
            elseif  N then
            elseif  a>0.05 then
                B=(h.rt.foc or 800)*8/a;
                if j.X>-B then
                    if j.Y>-B then
                        if j.X<M.X+B then
                            if j.Y<M.Y+B then
                                o.vis=true;
                            end;
                        end;
                    end;
                end;
            end;
            if K.onSc then
                o=b.opt_flags(S,t);
                if o.hp then
                    K.hp,K.maxHp=S.getHp(K.plr,K.char);
                end;
                if o.arm then
                    K.arm=S.getArm(K.plr);
                end;
                if o.wep then
                    K.wep=S.getWep(K.plr);
                end;
                if o.mon then
                    K.mon=S.getMoney and S.getMoney(K.plr)or 0;
                end;
                if o.pn then
                    K.pn=S.getPing and S.getPing(K.plr)or 0;
                end;
                if o.ind then
                    if type(S.getIndicators)=="function"then K.indicators=S.getIndicators(K.plr,K.char,t.flashed==true);
                end;
            end;
            if t.skel then
                K:skeleton();
            else
                K.skpts=nil;
            end;
            if not(o.corn)then
                K.corn=nil;
                K._quiet=not t.skel;
                return;
            end;
            if#K.charCache==0 then
                K:rebuild();
            elseif  not(K.cacheValid)then
                K:rebuild();
            end;
            if#K.charCache==0 then
                K.onSc=false;
                return;
            end;
            N,M=h.bounds(K.charCache);
            if N then
                if not M then
                    K.onSc=false;
                    K.cacheValid=false;
                    return;
                end;
            else
                K.onSc=false;
                K.cacheValid=false;
                return;
            end;
            if A then
                K.corn=h.calc_corners_viewport(N,M,x,A);
            else
                K.corn=h.calc_corners(N,M,K._cornT,K._cornPts);
            end;
            return;
        end;
        if t.offAr then
            if not(p)then
                M=j-h.viewport()*0.5;
                M=if a<=0 then
                    -M
                else
                    M;
                    S=M.Magnitude;
                    if S>0.001 then
                        K.dir=M/S;
                        return;
                    end;
                    o=h.overridden()and h.view_frame()or x.CFrame;
                    B=Y(i(o.Position,o.RightVector,Vector3.yAxis),T.Position);
                    A=Vector2.new(B.X,B.Z);
                    N=A.Magnitude;
                    K.dir=N>0.001 and A/N or K.dir or Vector2.new(0,-1);
                end;
            end;
        end;
        O.skeleton=function(j)local h=j.char;
        if h then
            if not(j.onSc)then
                j.skpts=nil;
                return;
            end;
        else
            j.skpts=nil;
            return;
        end;
        local K=j._skparts;
        if K then
        else
            K={};
            j._skparts=K;
        end;
        if j._skchar~=h or not j.cacheValid then
            local S=b.find_part;
            j._skchar=h;
            K.hd=S(h,"Head");
            K.ur=S(h,"UpperTorso")or S(h,"Torso");
            K.lr=S(h,"LowerTorso")or S(h,"Torso");
            K.lua=S(h,"LeftUpperArm")or S(h,"Left Arm");
            K.rua=S(h,"RightUpperArm")or S(h,"Right Arm");
            K.lfa=S(h,"LeftLowerArm")or S(h,"LeftHand");
            K.rfa=S(h,"RightLowerArm")or S(h,"RightHand");
            K.lul=S(h,"LeftUpperLeg")or S(h,"Left Leg");
            K.rul=S(h,"RightUpperLeg")or S(h,"Right Leg");
            K.lll=S(h,"LeftLowerLeg")or S(h,"LeftFoot");
            K.rll=S(h,"RightLowerLeg")or S(h,"RightFoot");
        end;
        h=K.hd;
        if h then
            if not(h.Parent)then
                j.skpts=nil;
                return;
            end;
        else
            j.skpts=nil;
            return;
        end;
        local b=j._skpts;
        if b then
        else
            b={};
            j._skpts=b;
        end;
        G(b);
        b.hd=h.Position;
        local h,S,o,t,i,Y,T,x,p,A=K.ur,K.lr,K.lua,K.rua,K.lfa,K.rfa,K.lul,K.rul,K.lll,K.rll;
        if h then
            if h.Parent then
                b.ur=h.Position;
            end;
        end;
        if S then
            if S.Parent then
                b.lr=S.Position;
            end;
        end;
        if o then
            if o.Parent then
                b.lua=o.Position;
            end;
        end;
        if t then
            if t.Parent then
                b.rua=t.Position;
            end;
        end;
        if i then
            if i.Parent then
                b.lfa=i.Position;
            end;
        end;
        if Y then
            if Y.Parent then
                b.rfa=Y.Position;
            end;
        end;
        if T then
            if T.Parent then
                b.lul=T.Position;
            end;
        end;
        if x then
            if x.Parent then
                b.rul=x.Position;
            end;
        end;
        if p then
            if p.Parent then
                b.lll=p.Position;
            end;
        end;
        if A then
            if A.Parent then
                b.rll=A.Position;
            end;
        end;
        j.skpts=b;
    end;
    O.destroy=function(j)j:drop_events();
    if j.av then
        pcall(j.av.Destroy,j.av);
        j.av=nil;
    end;
    G(j.charCache);
    j.corn=nil;
    j.skpts=nil;
    j.char=nil;
    j._hd=nil;
    j.viewport=nil;
    j.activeCam=nil;
    j.indicators=nil;
end;
return O;
end;

D.Z=function()local j,h,b,K=D.load("b"),D.load("a"),D.load("j"),D.load("V");
                            local S=D.load("Y");
                            local o=j.workspace;
                            local t=j.input;
                            local G=j.plain;
                            local i=math.clamp;
                            local Y=table.pack;
                            local O=table.unpack;
                            local T,x,p=Enum.UserInputType.MouseButton1,false,false;
                            local A=b.platform;
                            if type(A)=="function"then local M,a=pcall(A);
                            j.reclaim();
                            x=M and type(a)=="table"and table.find(a,"Mobile")~=nil and#a<=1;
                        else
                        end;
                        A=b.mobile_shoot;
                        if x then
                            if type(A)=="table"then if type(rawget(A,"SetManualFireHeld"))=="function"then h.field(A,"SetManualFireHeld",function(b)local function A(M,...)p=M==true;
                            return b(M,...);
                        end;
                        return A;
                    end);
                end;
            end;
        end;
        local b,A=x,{alive=true,generation=0};
        A.forcing=j.weak();
        A.intent=j.weak();
        A.manual=j.weak();
        A.last_target=j.weak();
        A.pending=j.weak();
        A.last_shot=0;
        A.last_scan=0;
        A.props=nil;
        A.origin=nil;
        A.target=nil;
        A.held=function()if b then
            local j=p;
            return j;
        end;
        return t:IsMouseButtonPressed(T);
    end;
    A.open_gate=function(j)local b=rawget(j,"ShootDelayThread");
    if b then
        pcall(task.cancel,b);
    end;
    j.ShootDelayThread=nil;
    j.IsShooting=false;
    j.NextShotDue=nil;
end;
A.can_force=function(j,b)if j then
    if j.IsDestroyed then
        return false;
    elseif  not(j.IsEquipped)then
        return false;
    end;
else
    return false;
end;
if j.IsReloading then
    return false;
elseif  j.IsAdjustingSuppressor then
    return false;
end;
if type(j.Rounds)~="number"then return false;
elseif  j.Rounds<=0 then
    return false;
end;
local t=j.Properties;
if t then
    if t.Class~="Weapon"then return false;
end;
else
    return false;
end;
if b=="rapid"then if j.IsChargeFiring then
    return false;
elseif  j.IsBurstShooting then
    return false;
end;
if t.ShootingOptions=="Revolver"then return false;
end;
end;
return true;
end;
A.has_pending=function(j)for b,b in A.pending,nil,nil do
    if b==j then
        return true;
    end;
end;
return false;
end;
A.bind=function(j,b,t)A.props=j;
A.origin=b;
A.target=t;
end;
A.unbind=function()A.props=nil;
A.origin=nil;
A.target=nil;
end;
A.cancel=function()A.generation=A.generation+1;
for j in A.pending,nil,nil do
    pcall(task.cancel,j);
    A.pending[j]=nil;
end;
for j,b in A.manual,nil,nil do
    A.manual[j]=nil;
    if type(b)=="table"then if b.thread then
        pcall(task.cancel,b.thread);
        b.thread=nil;
    end;
end;
end;
for j in A.last_target,nil,nil do
    A.last_target[j]=nil;
end;
for j in A.intent,nil,nil do
    A.intent[j]=nil;
end;
A.unbind();
end;
A.toward=function(j,b,t,...)local T=o.CurrentCamera;
if T then
    if j then
        if typeof(b)~="Vector3"then return false;
    elseif  typeof(t)~="Vector3"then return false;
end;
else
    return false;
end;
else
    return false;
end;
if(t-b).Magnitude<=1.0E-4 then
    return false;
end;
if not(S.ready(j))then
    return false;
end;
local o,x=T.CFrame,CFrame.lookAt(b,t);
t,b=x:ToEulerAnglesYXZ();
K.weapon=j;
K.cframe=x;
K.yaw=b;
K.pitch=i(x.LookVector.Y,-1,1);
K.expires=os.clock()+0.12;
K.cmd_samples=4;
A.last_target[j]=nil;
A.forcing[j]=(A.forcing[j]or 0)+1;
T.CFrame=x;
x=Y(G(j.shoot,j,...));
T.CFrame=o;
A.last_target[j]=nil;
b=(A.forcing[j]or 1)-1;
A.forcing[j]=b>0 and b or nil;
K.weapon=nil;
K.cframe=nil;
if x[1]then
    S.mark(j);
else
    K.expires=0;
    K.cmd_samples=0;
end;
return O(x,1,x.n);
end;
A.force=function(j,b,o)if not(A.can_force(j,o))then
    return false;
end;
if not(S.ready(j))then
    return false;
end;
A.open_gate(j);
A.last_target[j]=nil;
A.forcing[j]=(A.forcing[j]or 0)+1;
local t,i,Y=tonumber(j.ShotSeq),tonumber(j.Rounds),G(j.shoot,j,O(b,1,b.n));
if o=="rapid"then A.open_gate(j);
end;
b=(A.forcing[j]or 1)-1;
A.forcing[j]=b>0 and b or nil;
A.last_target[j]=nil;
o,b=tonumber(j.ShotSeq),tonumber(j.Rounds);
local G=t and o and o>t;
G=G or(if i then
    if b then
        b<i
    else
        G
    else
        G);
        if Y then
            if G then
                S.mark(j);
                return true;
            end;
        end;
        return false;
    end;
    h.teardown(function()A.alive=false;
    A.cancel();
    K.clear();
end);
return A;
end;

D.ag=function()local m=D.load("q").white;
        return{on=false,team_check=true,boxes={head=true,chest=true},prefer="head",auto_shoot=false,auto_scope=false,auto_wall=false,wallbang=false,wall_power=3,magic=false,auto_revolver=false,auto_switch=false,double_tap=false,rapid=false,no_recoil=false,no_spread=false,insta_reload=false,min_damage=0,wall_min_damage=0,fov=8,draw_fov=false,fov_col=m,fov_grad=false,fov_col2=m,fov_fill=false,fov_fill_col=m,fov_fill_grad=false,fov_fill_col2=m,multipoint=false,origin_shift=0,head_size=65,chest_size=60,stomach_size=60,arms_size=55,legs_size=55,reg_hits=0,reg_miss=0,reg_lead=0};
    end;

D.ah=function()local m,j=D.load("b"),D.load("a");
    local h=m.lp;
    local b=m.http;
    local K=os.clock;
    local S=math.max;
    local o=math.min;
    local t=string.lower;
    local G=string.find;
    local i=table.remove;
    local Y=m.weak();
    local O,T=m.weak(),0.15;
    local m,x=-1,{};
    local function p(A)if A-m<0.25 then
        local M=T;
        return M;
    end;
    m=A;
    local m,A=pcall(h.GetNetworkPing,h);
    local M,a=if m then
        if type(A)=="number"then if A==A then
            if A>0 then
                A
            else
                0.05
            else
                0.05
            else
                0.05
            else
                0.05,tonumber(h:GetAttribute("Ping"));
                M=if a then
                    if a==a then
                        if a>0 then
                            if a<2000 then
                                if a/1000>M then
                                    a/1000
                                else
                                    M
                                else
                                    M
                                else
                                    M
                                else
                                    M
                                else
                                    M;
                                    T=o(M,1);
                                    A=T;
                                    return A;
                                end;
                                x.pending=function(m,h)local o=O[m];
                                if not(o)then
                                    return 0;
                                end;
                                local T,A=o.shots,o.hp;
                                o.hp=h;
                                if h>A+0.01 then
                                    table.clear(T);
                                    return 0;
                                end;
                                o=K();
                                m=p(o);
                                local p,M,a=o-(m*1.25+0.08),h<A-0.01 and o-m*0.8 or nil,0;
                                for h=#T,1,-1 do
                                    m=T[h];
                                    if m.t<=p or M and m.t<=M then
                                        i(T,h);
                                    else
                                        a+=m.dmg;
                                    end;
                                end;
                                return a;
                            end;
                            x.reserve=function(m)local h,o=m and m.char,tonumber(m and m.dmg);
                            if h then
                                if o then
                                    if o<=0 then
                                        return;
                                    end;
                                else
                                    return;
                                end;
                            else
                                return;
                            end;
                            m=h:GetAttribute("Health");
                            if typeof(m)~="number"then return;
                        elseif  m<=0 then
                            return;
                        end;
                        local T=O[h];
                        if T then
                        else
                            T={hp=m,shots={}};
                            O[h]=T;
                        end;
                        m=T.shots;
                        m[#m+1]={t=K(),dmg=o};
                        if#m>64 then
                            i(m,1);
                        end;
                    end;
                    x.armor=function(m)if not(m)then
                        return 0,false;
                    end;
                    local h,K=m:GetAttribute("Armor"),m.Character;
                    local o,i=K and K:GetAttribute("Armor")or nil,m:GetAttribute("Helmet");
                    i=if i==nil then
                        (m:GetAttribute("HasHelmet"))
                    else
                        i;
                        K=Y[m];
                        if K then
                            if K.raw==h then
                                if K.char_armor==o then
                                    if K.helmet_flag==i then
                                        return K.health,K.helmet;
                                    end;
                                end;
                            end;
                        end;
                        local T,p=0,i==true;
                        if type(h)=="number"then T=(S(0,h));
                    else
                        if type(h)=="string"then local A,M=pcall(b.JSONDecode,b,h);
                        if A then
                            if type(M)=="table"then K=S(0,tonumber(M.Health)or 0);
                            p=p or M.Helmet==true;
                            p=if G(t(tostring(M.Type or"")),"helmet",1,true)then
                                true
                            else
                                p;
                                T=K;
                            else
                            end;
                        else
                        end;
                    else
                    end;
                end;
                T=if T<=0 then
                    if type(o)=="number"then S(0,o)
                else
                    T
                else
                    T;
                    Y[m]={raw=h,char_armor=o,helmet_flag=i,health=T,helmet=p};
                    return T,p;
                end;
                x.effective_armor=function(m)return x.armor(m);
            end;
            x.clear=function()for m in Y,nil,nil do
                Y[m]=nil;
            end;
            for m in O,nil,nil do
                O[m]=nil;
            end;
        end;
        j.teardown(x.clear);
        return x;
    end;

D.ai=function()return{groups={head={"Head"},chest={"UpperTorso"},stomach={"LowerTorso"},arms={"LeftUpperArm","RightUpperArm","LeftLowerArm","RightLowerArm","LeftHand","RightHand"},legs={"LeftUpperLeg","RightUpperLeg","LeftLowerLeg","RightLowerLeg","LeftFoot","RightFoot"}},order={"head","chest","stomach","arms","legs"},damage_key={Head="Head",UpperTorso="Torso",LowerTorso="Torso",LeftUpperArm="Arms",RightUpperArm="Arms",LeftLowerArm="Arms",RightLowerArm="Arms",LeftHand="Arms",RightHand="Arms",LeftUpperLeg="Legs",RightUpperLeg="Legs",LeftLowerLeg="Legs",RightLowerLeg="Legs",LeftFoot="Legs",RightFoot="Legs"},group_of={Head="head",UpperTorso="chest",LowerTorso="stomach",LeftUpperArm="arms",RightUpperArm="arms",LeftLowerArm="arms",RightLowerArm="arms",LeftHand="arms",RightHand="arms",LeftUpperLeg="legs",RightUpperLeg="legs",LeftLowerLeg="legs",RightLowerLeg="legs",LeftFoot="legs",RightFoot="legs"},size_key={head="head_size",chest="chest_size",stomach="stomach_size",arms="arms_size",legs="legs_size"},teams={["Counter-Terrorists"]=true,Terrorists=true}};
end;

D.al=function()local m,j,h,b,K=D.load("b"),D.load("a"),D.load("j"),D.load("ai"),D.load("ag");
                                        local S=D.load("ak");
                                        local o=D.load("ah");
                                        local t=D.load("i");
                                        local G=m.storage;
                                        local i,Y,O=h.inventory,b.groups,{names={},valid={},aliases={}};
                                        O.by_props=m.weak();
                                        O.active=nil;
                                        O.weapon=nil;
                                        O.on_apply=nil;
                                        O.ui=nil;
                                        local m={pistols=1,rifles=2,snipers=3,smgs=4,shotguns=5,["machine guns"]=6,heavy=7,other=8};
                                        O.boxes=function(h)local b={};
                                        if type(h)=="table"then for T,T in h,nil,nil do
                                            if Y[T]then
                                                b[T]=true;
                                            end;
                                        end;
                                    end;
                                    return b;
                                end;
                                O.category=function(h)if type(h)~="table"then return nil;
                            end;
                            local b,Y=tostring(rawget(h,"Type")or""),tostring(rawget(h,"MuzzleType")or"");
                            if Y=="Zeus x27"then return nil;
                        end;
                        if Y=="Sniper"then return"snipers";
                    end;
                    if Y=="ShotGun"then return"shotguns";
                end;
                if Y=="MachineGun"then return"machine guns";
            end;
            if b=="Pistol"then return"pistols";
        end;
        if b=="Rifle"then return"rifles";
    end;
    if b=="SMG"then return"smgs";
end;
if b=="Heavy"then return"heavy";
end;
return"other";
end;
O.load=function()local h=G:FindFirstChild("Database");
local b=h and(h:FindFirstChild("Custom"));
h=b and(b:FindFirstChild("Weapons"));
if not h then
    return;
end;
b=h:GetChildren();
for G=1,#b,1 do
    h=b[G];
    if h:IsA("ModuleScript")then
        if h.Name~="Zeus x27"then local b,Y=pcall(require,h);
        G=b and type(Y)=="table"and Y.Class=="Weapon"and O.category(Y);
        if G then
            O.by_props[Y]=G;
            O.aliases[h.Name:lower()]=G;
            if not(O.valid[G])then
                O.valid[G]=true;
                O.names[#O.names+1]=G;
            end;
        end;
    end;
end;
end;
table.sort(O.names,function(h,b)local G,Y=m[h]or math.huge,m[b]or math.huge;
if G==Y then
    return h<b;
end;
return G<Y;
end);
end;
O.find_type=function(m)if type(m)~="table"then return nil;
end;
local h=rawget(m,"Properties");
local b=h and O.by_props[h]or nil;
b=b or(if type(h)=="table"then O.category(h)
else
    b);
    if b then
    else
        h=rawget(m,"Name");
        b=if type(h)=="string"then O.aliases[h:lower()]
    else
        b;
    end;
    if b then
        if O.valid[b]then
            return b;
        end;
    end;
    return nil;
end;
-- DaDa owns the three global switches; weapon changes must not reset them.
O.apply=function()end;
O.refresh=function()O.apply(O.active);
end;
O.activate=function(m)local h=O.find_type(m);
if O.weapon==m then
    if O.active==h then
        return;
    end;
end;
O.weapon=m;
O.active=h;
O.apply(h);
end;
local m;
local h=type(i)=="table"and rawget(i,"peekCurrentEquippedForMovement")or nil;
local function b()if type(h)~="function"then return nil;
end;
local K,S=pcall(h);
if K then
    if type(S)~="table"then return nil;
elseif  S.IsDestroyed then
    return nil;
elseif  not(S.IsEquipped)then
    return nil;
end;
else
    return nil;
end;
return S;
end;
O.held=function()local h=m;
if h then
    if not(h.IsDestroyed)then
        if h.IsEquipped then
            O.activate(h);
            return h;
        end;
    end;
end;
m=nil;
O.activate(nil);
return nil;
end;
O.adopt=function(h)m=h;
end;
O.ensure=function()local h=O.held();
if h then
    return h;
end;
h=b();
if h then
    m=h;
end;
O.activate(h);
return h;
end;
O.load();
j.teardown(function()m=nil;
O.weapon=nil;
O.active=nil;
O.ui=nil;
o.clear();
end);
return O;
end;

D.ao=function()local m=D.load("q").white;
                        return{on=false,team_check=true,auto_wall=false,boxes={head=true,chest=true,stomach=true,arms=true},prefer="head",min_damage=0,wall_min_damage=0,auto_revolver=false,auto_switch=false,hit_chance=70,draw_fov=false,fov_col=m,fov_grad=false,fov_col2=m,fov_fill=false,fov_fill_col=m,fov_fill_grad=false,fov_fill_col2=m};
                    end;

D.ap=function()local m,j=D.load("b"),D.load("a");
                    local h=D.load("h");
                    local b,K=D.load("j"),D.load("Z");
                    local S=D.load("ag");
                    local o=D.load("ao");
                    local t=D.load("al");
                    local G=D.load("aj");
                    local i=m.lp;
                    local Y=m.workspace;
                    local O=m.input;
                    local T,x=m.storage,m.clips;
                    local p=m.keyframes;
                    local A,M,a,B=m.getups,m.info,b.weapon,Enum.UserInputType.MouseButton2;
                    local N=math.max;
                    local I=math.min;
                    local R=math.clamp;
                    local n=math.huge;
                    local E=os.clock;
                    local d,w=m.plain,{};
                    local P=m.weak();
                    local r=m.weak();
                    local L,Z,X=m.weak(),0,0.03333333333333333;
                    local q=-n;
                    local U,z,J=-n,false;
                    m=type(a)=="table"and rawget(a,"startRevolverCharge")or nil;
                    if type(m)=="function"and type(A)=="function"and type(M)=="function"then a,b=pcall(A,m);
                    if a and type(b)=="table"then for y,y in b,nil,nil do
                        if type(y)=="function"and M(y,"n")=="completeRevolverChargeShot"then J=y;
                        break;
                    end;
                end;
            else
            end;
        else
        end;
        local function y(f)if type(f)~="table"then return nil;
    elseif  f.ShootingOptions~="Revolver"then return nil;
end;
local k=f.FireModes;
f=type(k)=="table"and k.Primary or nil;
if type(f)=="table"then if f.InputBehavior=="Charge"then return f;
end;
end;
return nil;
end;
local function f(k,g)local Q=k.Viewmodel;
k=type(Q)=="table"and Q.Animation or nil;
if type(k)~="table"then return nil;
end;
Q=g.Animation;
return type(Q)=="string"and k:getAnimation(Q)or nil or(k:getAnimation("Shoot"));
end;
local function k(g)local Q;
if g:IsA("KeyframeSequence")then
    local c=g:GetKeyframes();
    for H=1,#c,1 do
        local _=c[H];
        H=_:GetMarkers();
        for c=1,#H,1 do
            Q=if H[c].Name=="Shoot"then if Q then
                if _.Time<Q then
                    _.Time
                else
                    Q
                else
                    _.Time
                else
                    Q;
                end;
            end;
        else
            local c=g:GetDescendants();
            for g=1,#c,1 do
                local H=c[g];
                if H:IsA("MarkerCurve")then
                    g=H:GetMarkers();
                    for c=1,#g,1 do
                        local H=g[c];
                        Q=if H.Value=="Shoot"then if Q then
                            if H.Time<Q then
                                H.Time
                            else
                                Q
                            else
                                H.Time
                            else
                                Q;
                            end;
                        else
                        end;
                    end;
                end;
                return Q;
            end;
            local function g(Q,c,H)if not(Q)then
                return nil;
            end;
            local _,s=pcall(Q[c],Q,H);
            if _ then
                if typeof(s)~="Instance"then return nil;
            end;
        else
            return nil;
        end;
        _,Q=pcall(k,s);
        pcall(s.Destroy,s);
        if _ then
            if type(Q)=="number"then return Q;
        end;
    end;
    return nil;
end;
local function k(Q)local c=g(x,"GetAnimationClipAsync",Q)or g(p,"GetKeyframeSequenceAsync",Q);
if c then
    if j.alive()then
        w[Q]=c;
    end;
end;
end;
local function x(p)if type(p)=="string"then if p~=""then if w[p]==nil then
    w[p]=false;
    j.spawn(k,p);
end;
end;
end;
end;
A=T:FindFirstChild("Database");
b=A and(A:FindFirstChild("Custom"));
T=b and(b:FindFirstChild("Weapons"));
if T then
    b=T:GetChildren();
    for T=1,#b,1 do
        a=b[T];
        if a:IsA("ModuleScript")then
            A,M=pcall(require,a);
            T=A and y(M)or nil;
            m=T and M.CameraAnimations;
            if typeof(m)=="Instance"then local b=m:FindFirstChild(type(T.Animation)=="string"and T.Animation or"Shoot");
            if b then
                if b:IsA("Animation")then
                    x(b.AnimationId);
                end;
            end;
        end;
    end;
end;
end;
local function m(b,T)local p,A=N(tonumber(b.ChargeTime)or 0,0),T and T.Animation;
b=A and A.AnimationId;
x(b);
A=b and w[b];
if A then
    return N(p,A)+0.03333333333333333,A;
end;
return p+0.05,nil;
end;
local function b(T,x)P[T]=nil;
r[T]=nil;
L[T]=x;
if T.IsChargeFiring then
    d(T.cancelRevolverCharge,T,false);
end;
end;
local function T(x,p)if x.IsDestroyed then
    return false;
elseif  not(x.IsEquipped)then
    return false;
end;
if x.IsShooting then
    return false;
elseif  x.IsReloading then
    return false;
elseif  x.IsAdjustingSuppressor then
    return false;
elseif  x.IsAlternativeFireHeld then
    return false;
elseif  x.IsInspecting then
    return false;
end;
local A=x.Rounds;
if type(A)~="number"then return false;
elseif  A<=0 then
    return false;
end;
if p-(L[x]or-n)<0.05 then
    return false;
end;
if O:IsMouseButtonPressed(B)then
    return false;
elseif  Y:GetAttribute("GameState")=="Buy Period"then return false;
end;
if i:GetAttribute("IsDefusingBomb")==true then
    return false;
elseif  i:GetAttribute("IsLocallyDefusingBomb")==true then
    return false;
end;
if not(G.alive(i.Character))then
    return false;
end;
A=x.Viewmodel;
p=type(A)=="table"and A.Animation or nil;
A=type(p)=="table"and p:getAnimation("Equip")or nil;
p=A and A.Length or 0;
return(p>0 and p*0.925 or 0.5)<tick()-(tonumber(x.WeaponEquippedTick)or 0);
end;
local function Y(O)local x=O and P[O];
if x==nil then
    return nil,nil;
elseif  O.IsChargeFiring~=true then
    return nil,nil;
elseif  r[O]~=O.ChargeStartTick then
    return nil,nil;
end;
return x,tick()-(tonumber(O.ChargeStartTick)or 0);
end;
local function O(x)local p,A=Y(x);
return p~=nil and p-A<=0.05;
end;
local function x(p)if p-U<0.1 then
    local A=z;
    return A;
end;
U,z=p,false;
p=i.Character;
local A=p and(p:FindFirstChild("HumanoidRootPart"));
if not(A)then
    return false;
end;
local M,a,B=A.Position,h.all();
for h=1,B,1 do
    p=a[h];
    if p~=i then
        h=p.Character;
        if h then
            local i,A=G.valid(p,h);
            if i then
                if A then
                    if(A.Position-M).Magnitude<=50 then
                        z=true;
                        break;
                    end;
                end;
            end;
        end;
    end;
end;
B=z;
return B;
end;
local function h(G)local i=G-q<0.75 or x(G);
return i;
end;
local G={spot=function(i)q=i or E();
end,engage=function(i,x)x=x or(E());
q=x;
local p,A=Y(i);
if p then
    if p-A>0.05 then
        if not(K.held())then
            b(i,x);
        end;
    end;
end;
end,wait=function(i)local x,p=Y(i);
if not(x)then
    return nil,nil;
end;
return N(x-p,0),x;
end,ready=function(i)local x,p=Y(i);
i=x~=nil and p>=x and p<=x+X;
return i;
end,held=function(i)return Y(i)~=nil;
end,can_slam=function(i,Y)if i then
    if i.IsChargeFiring then
        return false;
    end;
else
    return false;
end;
return(Y or E())-(L[i]or-n)>=0.05;
end
};
G.fire=function(i)local Y=y(i.Properties);
if Y then
    if not(G.ready(i))then
        return false;
    end;
else
    return false;
end;
local x=f(i,Y);
Y=nil;
if J then
    Y=d(J,i);
else
    i.CurrentWalkSpeedOverride=nil;
    Y=d(i.shoot,i,"Primary");
end;
if not(i.IsChargeFiring)then
    P[i]=nil;
    r[i]=nil;
    if x then
        if x.Speed==0 then
            pcall(x.AdjustSpeed,x,1);
        end;
    end;
end;
return Y;
end;
G.slam=function(i)if not(G.can_slam(i,E()))then
    return false;
end;
return d(i.shoot,i,"Secondary");
end;
G.pull=function(i,Y)if G.ready(i)then
    return G.fire(i);
end;
if Y then
    return G.slam(i);
end;
return false;
end;
local function i(Y,x,p,A)local M=Y.ChargeShootConnection;
if M then
    pcall(M.Disconnect,M);
    Y.ChargeShootConnection=nil;
end;
M=Y.ChargeThread;
if M then
    pcall(task.cancel,M);
    Y.ChargeThread=nil;
end;
M=f(Y,x);
local a,B=m(x,M);
x=tick()-(tonumber(Y.ChargeStartTick)or 0);
P[Y]=a;
if M then
    local m,U=N((B or a)-0.01,0),M.TimePosition;
    if M.Speed~=0 then
        if U+p>=m then
            M:AdjustSpeed(0);
        end;
    end;
    if M.Speed==0 then
        local p=I(x,m);
        if U<p then
            M.TimePosition=p;
        elseif  U>m then
            M.TimePosition=p;
        end;
    end;
end;
if x<a then
    return;
end;
if K.held()then
    if G.fire(Y)then
        return;
    end;
end;
if Y.IsChargeFiring then
    if x>a+X then
        b(Y,A);
    end;
end;
end;
G.step=function()local m=E();
local Y=R((m-Z)*2,0.02,0.1);
Z=m;
X=R(Y,0.03333333333333333,0.05);
local x=t.ensure();
local t=x and y(x.Properties);
if not(t)then
    return;
end;
if x.IsChargeFiring then
    L[x]=m;
end;
local p,A=S.on and S.auto_revolver,o.on and o.auto_revolver;
local M=p or A;
M=if M and(if p then
    S.auto_switch
else
    not p)and(if A then
        o.auto_switch
    else
        not A)then
            if h(m)then
                false
            else
                M
            else
                M;
                if P[x]~=nil then
                    if x.IsChargeFiring~=true then
                        P[x]=nil;
                        r[x]=nil;
                    elseif  r[x]~=x.ChargeStartTick then
                        P[x]=nil;
                        r[x]=nil;
                    elseif  M then
                        i(x,t,Y,m);
                        return;
                    elseif  K.held()then
                        i(x,t,Y,m);
                        return;
                    elseif  O(x)then
                        i(x,t,Y,m);
                        return;
                    else
                        b(x,m);
                        return;
                    end;
                end;
                if M then
                    if not(x.IsChargeFiring)then
                        if T(x,m)then
                            if d(x.startRevolverCharge,x,nil)then
                                if x.IsChargeFiring then
                                    x.IsFireHeld=false;
                                    x.FireInputBinding=nil;
                                    r[x]=x.ChargeStartTick;
                                    L[x]=m;
                                    i(x,t,Y,m);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            j.teardown(function()for m in P,nil,nil do
                P[m]=nil;
                if m.IsChargeFiring then
                    if not(m.IsDestroyed)then
                        d(m.cancelRevolverCharge,m,false);
                    end;
                end;
            end;
            table.clear(r);
            table.clear(L);
            table.clear(w);
            q,z=-n,false;
        end);
        return G;
    end;

D.aq=function()local m,j,h,b=D.load("b"),D.load("a"),D.load("j"),D.load("Z");
    local K=D.load("V");
    local S=D.load("M");
    local o=D.load("Y");
    local t=D.load("ag");
    local DADA_CFG=t;
    local G=D.load("ah");
    local i=D.load("aj");
    local Y=D.load("al");
    local O=D.load("an");
    local T=D.load("ap");
    local x=D.load("g");
    local p=m.lp;
    local A=m.workspace;
    local M,a=m.info,m.plain;
    local B,N,I,R,n=h.weapon,h.bullet,h.camera,h.crosshair,h.remotes;
    local E=h.hints;
    local d=h.root_frame;
    local w,P=h.hit_flinch,h.fire_ready;
    local r=h.legit_ready;
    local L=table.pack;
    local Z=table.unpack;
    local X=math.max;
    local q=math.abs;
    local U,U,z,J=math.floor,L(),{tick=nil,seq=nil,id=nil};
    local y,f=h.mv_runtime,h.local_char;
    h=type(f)=="table"and rawget(f,"GetRemoteViewTick")or nil;
    if type(y)=="table"and type(h)=="function"and type(m.getups)=="function"then local k,g=pcall(m.getups,h);
    if k and type(g)=="table"then for k,k in g,nil,nil do
        if type(k)=="table"and getmetatable(k)==y then
            J=k;
            break;
        end;
    end;
else
end;
else
end;
local function k()local g=J and rawget(J,"_remoteClock");
if type(g)~="table"then return true;
end;
local Q,c,H=rawget(g,"_position"),rawget(g,"_latestTicks"),rawget(g,"_renderOffsetTicks");
if type(Q)~="number"then return true;
elseif  type(c)~="number"then return true;
elseif  type(H)~="number"then return true;
end;
return Q-H-c<=1;
end;
local function g(Q)local c=Q.VisualRoot;
if typeof(c)=="Vector3"then return c;
end;
c=Q.Actor;
if type(d)=="table"then local Q,H=pcall(d.simulationToVisualRootPosition,c.Position,c.DuckAmount);
if Q then
    if typeof(H)=="Vector3"then return H;
end;
end;
end;
return c.Position;
end;
local function d(Q,c)local H=#Q;
local _=Q[H];
local s,F=_.Actor.Generation,_.Actor.ActorId;
if c>=_.ServerTick then
    return g(_),_.Actor.LookYaw;
end;
for v=H-1,1,-1 do
    _=Q[v];
    if _.ServerTick<=c then
        local H=Q[v+1];
        if _.Actor.Generation~=s then
            return nil,nil;
        elseif  _.Actor.ActorId~=F then
            return nil,nil;
        elseif  H.Actor.Generation~=s then
            return nil,nil;
        elseif  H.Actor.ActorId~=F then
            return nil,nil;
        end;
        local Q=H.ServerTick-_.ServerTick;
        local s,F,v=Q>0 and(c-_.ServerTick)/Q or 0,_.Actor.LookYaw,H.Actor.LookYaw;
        return g(_):Lerp(g(H),s),F+((v-F+3.141592653589793)%6.283185307179586-3.141592653589793)*s;
    end;
end;
return nil,nil;
end;
local function g(Q)local c,H=J and rawget(J,"_remoteClock"),J and rawget(J,"_remoteBuffer");
if type(c)~="table"then return nil;
elseif  type(H)~="table"then return nil;
end;
local _,s=Q.player;
if x.is(_)then
    local x,F=_:GetAttribute("ActorId"),rawget(H,"_actorIdToKey");
    s=x~=nil and type(F)=="table"and F[x]or nil;
else
    s=if _ then
        _.UserId
    else
        s;
    end;
    _=rawget(H,"_actors");
    local x=s~=nil and type(_)=="table"and _[s]or nil;
    _=type(x)=="table"and x.Samples or nil;
    if type(_)~="table"then return nil;
elseif #_==0 then
    return nil;
end;
local s,F=pcall(J.getRemoteViewTick,J);
local J,v,u=rawget(H,"_latestServerTick"),rawget(c,"_latestAtSeconds"),rawget(c,"_hz");
if s then
    if type(F)~="number"then return nil;
elseif  type(J)~="number"then return nil;
elseif  type(v)~="number"then return nil;
elseif  type(u)~="number"then return nil;
end;
else
    return nil;
end;
c=_[#_];
s,H=c.ServerTick,x.Activity;
x=type(H)=="table"and H[#H]or nil;
s=if type(x)=="table"then if x.Active then
    if x.Generation==c.Actor.Generation then
        if x.ActorId==c.Actor.ActorId then
            if type(x.ServerTick)=="number"then if x.ServerTick>s then
                x.ServerTick
            else
                s
            else
                s
            else
                s
            else
                s
            else
                s
            else
                s;
                x=X(F,J+(p:GetNetworkPing()+X(os.clock()-v,0))*u-11);
                x=if x>s then
                    s
                else
                    x;
                    if q(x-F)<0.25 then
                        return nil;
                    end;
                    F,v,c=Q.char and i.part(Q.char,"HumanoidRootPart"),d(_,x);
                    if F then
                        if v then
                            if type(c)~="number"then return nil;
                        end;
                    else
                        return nil;
                    end;
                else
                    return nil;
                end;
                return x,CFrame.new(v)*CFrame.Angles(0,c,0)*F.CFrame:Inverse();
            end;
            local function x(d,J,Q)z.tick=nil;
            if d.rewound then
                return;
            elseif  J then
                if type(Q)~="number"then return;
            end;
        else
            return;
        end;
        d.rewound=true;
        local c=d.shot;
        if type(c)~="table"then return;
    elseif  typeof(c.origin)~="Vector3"then return;
elseif  typeof(c.hit_pos)~="Vector3"then return;
end;
local H,_=g(d);
if not(H)then
    return;
end;
d=_*c.hit_pos;
local g=d-c.origin;
local s=g.Magnitude;
if s<=0.001 then
    return;
end;
c.hit_pos=d;
c.dir=g/s;
c.dist=s;
if typeof(c.normal)=="Vector3"then c.normal=_:VectorToWorldSpace(c.normal);
end;
z.tick=H;
z.seq=Q;
z.id=J.Identifier;
end;
h=type(n)=="table"and n.Inventory or nil;
y=type(h)=="table"and h.ShootWeapon or nil;
if type(y)=="table"then if type(rawget(y,"Send"))=="function"then j.field(y,"Send",function(d)return function(J,...)o.mark();if type(DADA_CFG.on_send)=="function"then pcall(DADA_CFG.on_send);end;
local g=z.tick;
if g then
    z.tick=nil;
    if type(J)=="table"then if J.Seq==z.seq+1 then
        if J.Identifier==z.id then
            J.ViewTick=g;
        end;
    end;
end;
end;
return d(J,...);
end;
end);
end;
end;
local h={};
if type(I)=="table"then local d;
d=j.detour(rawget(I,"setWeaponRecoil"),function(...)if t.no_recoil then
    return nil;
end;
return d(...);
end);
local d;
d=j.detour(rawget(I,"weaponKick"),function(...)if t.no_recoil then
    return nil;
end;
return d(...);
end);
end;
if type(N)=="table"then local d;
d=j.detour(rawget(N,"getTrueSpread"),function(...)if t.no_spread then
    return 0;
end;
return d(...);
end);
end;
y=type(R)=="table"and rawget(R,"UpdateCrosshair")or nil;
if type(y)=="function"and type(m.getups)=="function"and type(M)=="function"then I,f=pcall(m.getups,y);
if I and type(f)=="table"then local m=UDim2.new();
for I,R in f,nil,nil do
    if type(R)=="function"then if M(R,"n")=="calculateRecoilOffset"then j.upvalue(y,I,function(...)if t.no_recoil then
        return m;
    end;
    return R(...);
end);
break;
end;
end;
end;
end;
end;
local function m(M,I)if b.manual[M]~=I then
    return;
end;
I.thread=nil;
local R=b.alive;
if(if R then
    I.generation~=b.generation
else
    not R)or not t.rapid or Y.held()~=M or not b.held()or not b.can_force(M,"rapid")then
        b.manual[M]=nil;
        b.last_target[M]=nil;
        return;
    end;
    R=o.wait(M);
    if R>0 then
        I.thread=task.delay(R+0.001,m,M,I);
        return;
    end;
    R=b.force(M,I.args,"rapid");
    if b.manual[M]~=I then
        return;
    elseif  I.generation~=b.generation then
        return;
    end;
    if not R then
        b.manual[M]=nil;
        b.last_target[M]=nil;
        return;
    end;
    b.last_shot=os.clock();
    I.thread=task.defer(m,M,I);
end;
local function M(I,R)if b.manual[I]then
    return;
elseif  b.alive then
    if not(t.rapid)then
        return;
    end;
else
    return;
end;
b.cancel();
if b.alive then
    if t.rapid then
        if Y.held()~=I then
            return;
        elseif  b.held()then
            if not(b.can_force(I,"rapid"))then
                return;
            end;
        else
            return;
        end;
    else
        return;
    end;
else
    return;
end;
local d={args=R,generation=b.generation,thread=nil};
b.manual[I]=d;
b.open_gate(I);
d.thread=task.defer(m,I,d);
end;
local function m(I,R)local d,w=I and I.Properties,A.CurrentCamera;
if d then
    if d.Class~="Weapon"then return nil;
elseif  w then
else
    return nil;
end;
else
    return nil;
end;
I=S.origin(w);
w=O.find(d,I,true,R);
if not w then
    return nil;
end;
return d,I,w;
end;
local function I(R,d,w,J)if b.alive then
    if not(t.double_tap)then
        return;
    end;
else
    return;
end;
if type(R.Rounds)~="number"then return;
elseif  R.Rounds<=0 then
    return;
end;
if b.manual[R]then
    return;
elseif  b.has_pending(R)then
    return;
end;
local y,f=b.generation;
f=task.defer(function()local g=b.alive;
if(if g then
    y~=b.generation
else
    not g)or not t.double_tap then
        b.pending[f]=nil;
        return;
    elseif  Y.held()~=R then
        b.pending[f]=nil;
        return;
    elseif  b.manual[R]then
        b.pending[f]=nil;
        return;
    end;
    g=o.wait(R);
    if g>0 then
        task.wait(g+0.001);
        local Q=b.alive;
        if(if Q then
            y~=b.generation
        else
            not Q)or not t.double_tap then
                b.pending[f]=nil;
                return;
            elseif  Y.held()~=R then
                b.pending[f]=nil;
                return;
            elseif  b.manual[R]then
                b.pending[f]=nil;
                return;
            end;
        end;
        g=false;
        if w or J then
            local y,Q,c;
            if J then
                y,Q,c=m(R,J);
            else
            end;
            if c then
            else
                y,Q,c=m(R);
            end;
            if c then
                b.bind(y,Q,c);
                g=true;
            else
                if w then
                    b.pending[f]=nil;
                    return;
                end;
            end;
        else
        end;
        if b.manual[R]then
            if g then
                b.unbind();
            end;
            b.pending[f]=nil;
            return;
        end;
        local w=b.force(R,d,"double");
        if g then
            b.unbind();
        end;
        b.pending[f]=nil;
        if w then
            b.last_shot=os.clock();
        end;
    end);
    b.pending[f]=R;
end;
Y.on_apply=function(R,d)if R and not t.double_tap then
    b.cancel();
elseif  d~=t.rapid then
    b.cancel();
end;
if d~=t.rapid then
    b.last_scan=0;
end;
if not(t.on)then
    G.clear();
end;
end;
if P then
    j.field(B,"shoot",function(R)return function(d,...)if b.alive then
        if b.forcing[d]then
            return R(d,...);
        end;
    else
        return R(d,...);
    end;
    if b.manual[d]then
        b.open_gate(d);
        b.last_target[d]=nil;
        return nil;
    end;
    local w=b.intent[d]==true;
    local J,y=t.rapid and not w and b.held(),L(...);
    b.last_target[d]=nil;
    local f,g,Q,c=tonumber(d.ShotSeq),tonumber(d.Rounds),L(R(d,...)),b.last_target[d];
    b.last_target[d]=nil;
    local R,H=tonumber(d.ShotSeq),tonumber(d.Rounds);
    local _=f and R and R>f;
    if _ or(if g then
        if H then
            H<g
        else
            _
        else
            _)then
                o.mark(d);
                if J then
                    M(d,y);
                else
                    I(d,y,w,c);
                end;
            end;
            return Z(Q,1,Q.n);
        end;
    end);
end;
local function M(I)local R=n and n.Inventory;
local n=R and R.ReloadWeapon;
if type(n)~="table"then return false;
elseif  type(n.Send)~="function"then return false;
end;
if I then
    if I.IsDestroyed then
        return false;
    elseif  I.IsEquipped~=true then
        return false;
    elseif  I.IsAdjustingSuppressor then
        return false;
    end;
else
    return false;
end;
local d=I.Properties;
if type(d)~="table"then return false;
elseif  d.Class~="Weapon"then return false;
elseif  d.RechargeTime then
    return false;
end;
local w,J,y=tonumber(d.Rounds),tonumber(I.Rounds),tonumber(I.Capacity);
if w then
    if J then
        if y then
            if J>=w then
                return false;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
else
    return false;
end;
local f=I.Identifier;
if type(f)~="string"then return false;
end;
local g=A:GetAttribute("Gamemode")=="Deathmatch";
if y<=0 then
    if not(g)then
        return false;
    end;
end;
if I.IsChargeFiring then
    a(I.cancelRevolverCharge,I,false,false);
end;
local Q=R.CreateMagazine;
if type(Q)=="table"then if type(Q.Send)=="function"then pcall(Q.Send,f);
end;
end;
if not(pcall(n.Send,{Identifier=f,Rounds=J,Capacity=y}))then
    return false;
end;
if g and tonumber(d.ReloadAnimationCount)==1 then
    I.Rounds=w;
    I.Capacity=tonumber(d.Capacity)or y;
else
    Q=q(w-J);
    if y-Q>0 then
        I.Rounds=w;
        I.Capacity=X(0,y-Q);
    else
        I.Rounds=J+y;
        I.Capacity=0;
    end;
end;
I.CurrentReloadIdentity=nil;
I.IsReloading=false;
I.IsShooting=false;
I.CurrentWalkSpeedOverride=nil;
y=rawget(I,"ReloadTrackFinishedConnection");
if y then
    pcall(y.Disconnect,y);
    I.ReloadTrackFinishedConnection=nil;
end;
b.open_gate(I);
a(I.stopAllAnimations,I);
if E then
    if type(E.clearHint)=="function"then a(E.clearHint,E,"Reload");
end;
end;
return true;
end;
if P and type(B.reload)=="function"then j.field(B,"reload",function(B)return function(I,...)if t.insta_reload then
    if b.alive then
        local R,n=pcall(M,I);
        if R then
            if n then
                return;
            end;
        end;
    end;
end;
return B(I,...);
end;
end);
end;
local M={weapon=nil,seq=nil,at=0,target=false};
local function B(I)local R,n,E=I.char,I.part,I.shot;
I=type(E)=="table"and E.hit_part or nil;
return R~=nil and R.Parent~=nil and R:GetAttribute("Dead")==false and typeof(n)=="Instance"and n:IsDescendantOf(R)and typeof(I)=="Instance"and I:IsDescendantOf(R);
end;
local function I(R,n)local E=b.target;
if E then
    if b.props==R then
        if b.origin==n then
            if B(E)then
                if i.valid(E.player,E.char)then
                    return E;
                end;
            end;
        end;
    end;
end;
E=O.find(R,n,t.magic==true);
if E then
    if B(E)then
        return E;
    end;
end;
return nil;
end;
local function i(R,n,E)local d=A.CurrentCamera;
if not(d)then
    return R(n,E);
end;
local w,X=S.origin(d);
if not(X)then
    return R(n,E);
end;
X=d.CFrame;
d.CFrame=X.Rotation+w;
w=L(pcall(R,n,E));
d.CFrame=X;
if not(w[1])then
    error(w[2],0);
end;
return Z(w,2,w.n);
end;
if r then
    j.field(N,"_performRaycast",function(R)return function(n,E)if K.weapon then
        if n then
            if n.Weapon==K.weapon then
                if K.cframe then
                    local d=A.CurrentCamera;
                    if not(d)then
                        return R(n,0);
                    end;
                    local w=d.CFrame;
                    d.CFrame=K.cframe;
                    local K=L(pcall(R,n,0));
                    d.CFrame=w;
                    if not(K[1])then
                        error(K[2],0);
                    end;
                    return Z(K,2,K.n);
                end;
            end;
        end;
    end;
    local K=n and n.Properties;
    if t.on then
        if not(K)then
            return i(R,n,E);
        end;
    else
        return i(R,n,E);
    end;
    local d=A.CurrentCamera;
    if not(d)then
        return R(n,E);
    end;
    local w=n.Weapon;
    local L,Z=w and tonumber(w.ShotSeq),os.clock();
    local X;
    if w and M.weapon==w and M.seq==L and Z-M.at<0.02 then
        X=M.target;
        X=X and(if B(X)then
            X
        else
            false);
        else
            X=I(K,(S.origin(d)))or false;
            M.weapon=w;
            M.seq=L;
            M.at=Z;
            if X then
                x(X,w,L);
            end;
        end;
        M.target=X;
        if not(X)then
            return i(R,n,E);
        end;
        L=X.shot;
        K=L.hit_part;
        Z=K:IsA("BasePart");
        if(if Z then
            typeof(L.hit_pos)~="Vector3"else not Z)or typeof(L.dir)~="Vector3"or L.dir.Magnitude<=1.0E-4 or typeof(L.normal)~="Vector3"or type(L.dist)~="number"or L.dist~=L.dist or L.dist<=0 or type(L.wall_hits)~="table"then M.target=false;
            z.tick=nil;
            return i(R,n,E);
        end;
        Z=typeof(L.origin)=="Vector3"and L.origin or S.origin(d);
        d=L.hit_pos-Z;
        local x=d.Magnitude;
        if x<=1.0E-4 or q(x-L.dist)>0.05 or d.Unit:Dot(L.dir.Unit)<0.999 then
            M.target=false;
            z.tick=nil;
            return i(R,n,E);
        end;
        E,n,x={},L.wall_hits,0;
        for i=1,#n,1 do
            x+=1;
            E[x]=n[i];
        end;
        n=if typeof(L.material)=="EnumItem"then L.material.Name
    else
        if typeof(K.Material)=="EnumItem"then K.Material.Name else"Plastic";
        E[x+1]={Position=L.hit_pos,Instance=K,Material=n,Normal=L.normal,Exit=false};
        if w then
            b.last_target[w]=X.char;
        end;
        G.reserve(X);
        if type(DADA_CFG.on_shot)=="function"then pcall(DADA_CFG.on_shot,Z,L.hit_pos,K,X.dmg,X.char);end;
        return{Distance=L.dist,Origin=Z,Direction=L.dir,Hits=E};
    end;
end);
j.field(N,"setActive",function(j)return function(K,G)if G then
    b.cancel();
    Y.adopt(K.Weapon);
    b.intent[K.Weapon]=nil;
    Y.activate(K.Weapon);
elseif  K.Weapon==Y.weapon then
    b.intent[K.Weapon]=nil;
    b.cancel();
    Y.adopt(nil);
    Y.activate(nil);
end;
return j(K,G);
end;
end);
end;
local function j(K)if A:GetAttribute("GameState")=="Buy Period"then return false;
end;
if p:GetAttribute("IsDefusingBomb")==true then
    return false;
elseif  p:GetAttribute("IsLocallyDefusingBomb")==true then
    return false;
end;
local G=K.Viewmodel;
local i=type(G)=="table"and G.Animation or nil;
if type(i)~="table"then return true;
elseif  type(i.getAnimation)~="function"then return true;
end;
local G,x=pcall(i.getAnimation,i,"Equip");
i=G and x and tonumber(x.Length)or 0;
return tick()-(tonumber(K.WeaponEquippedTick)or 0)>i*0.925;
end;
h.auto=function()if r then
    if t.on then
        if not(t.auto_shoot)then
            return;
        end;
    else
        return;
    end;
else
    return;
end;
if b.held()then
    return;
elseif  not(k())then
    return;
end;
local K,G=os.clock(),Y.held();
if G then
    if b.manual[G]then
        return;
    end;
else
    return;
end;
local i=G.Properties;
if i then
    if i.Class~="Weapon"then return;
end;
else
    return;
end;
if P then
    if t.rapid then
        if b.can_force(G,"rapid")then
            if o.wait(G,i,K)>0 then
                return;
            end;
            if K-b.last_scan<0.033 then
                return;
            end;
            b.last_scan=K;
            local Y,x,p=m(G);
            if not(p)then
                return;
            end;
            b.bind(Y,x,p);
            p=b.force(G,U,"rapid");
            b.unbind();
            if p then
                b.last_shot=K;
            end;
            return;
        end;
    end;
end;
if G.IsAdjustingSuppressor then
    return;
elseif  G.IsReloading then
    if i.MuzzleType~="ShotGun"then return;
end;
end;
if G.Rounds then
    if G.Rounds<=0 then
        return;
    end;
else
    return;
end;
local m,Y=i.ShootingOptions=="Revolver",t.auto_revolver;
local x,p=if Y then
    t.auto_switch
else
    not Y,false;
    if m then
        if G.IsShooting then
            return;
        end;
        if T.ready(G)then
        else
            if x and T.can_slam(G,K)then
            else
                if x then
                    if not(T.held(G))then
                        return;
                    end;
                else
                    return;
                end;
                p=true;
            end;
        end;
    else
    end;
    if o.wait(G,i,K)>0 then
        return;
    elseif  not(j(G))then
        return;
    end;
    Y=A.CurrentCamera;
    if not Y then
        return;
    end;
    local j=S.origin(Y);
    Y=O.find(i,j,true);
    if not Y then
        return;
    end;
    if t.auto_scope then
        if i.HasScope then
            if not(G.IsAiming)then
                if type(G.scope)=="function"then b.open_gate(G);
                a(G.scope,G,true);
                if G.IsAiming then
                    return;
                end;
            end;
        end;
    end;
end;
if m then
    if p then
        T.engage(G,K);
        return;
    end;
    T.spot(K);
end;
b.bind(i,j,Y);
b.open_gate(G);
Y,j=tonumber(G.ShotSeq),tonumber(G.Rounds);
b.intent[G]=true;
i=if m then
    T.pull(G,x)
else
    a(G.shoot,G);
    b.intent[G]=nil;
    b.unbind();
    x,m=tonumber(G.ShotSeq),tonumber(G.Rounds);
    G=Y and x and x>Y;
    G=G or(if j then
        if m then
            m<j
        else
            G
        else
            G);
            if i then
                if G then
                    b.last_shot=K;
                end;
            end;
        end;
        return h;
    end;


local runtime = D.load("a")
runtime.takeover()
local function startDaDa()
    local services = D.load("b")
    local api = D.load("j")
    local modulesOk = (api.legit_ready and api.fire_ready) and true or false
    if not modulesOk then
        warn("DaDa: game modules (Components/Weapon, Shared/Raycast...) were not found. Menu still loads; aim/weapon hooks are disabled.")
    end
    local function tryLoad(name)
        local ok, res = pcall(D.load, name)
        if ok and res then return res end
        warn("DaDa: module '"..tostring(name).."' failed to load: "..tostring(res))
        return setmetatable({}, {__index=function() return function() end end})
    end
    local aim = D.load("ag")
    local profiles = tryLoad("al")
    local hooks = tryLoad("aq")
    local tracker = tryLoad("p")
    local painter = D.load("v")
    local esp = D.load("F")
    local enemy, friendly = esp.tSet.en, esp.tSet.fr

    ------------------------------------------------------------------
    -- NEW UI: library.lua based / 3 tabs / hotbar launcher
    ------------------------------------------------------------------
    local W, H, SIDE = 620, 410, 164
    local want = {auto=false, esp=false}

    local espAvailable=(type(Drawing)=="table" and type(Drawing.new)=="function")
        or (type(DrawingImmediate)=="table" and type(DrawingImmediate.GetPaint)=="function")
    local function syncAuto()
        aim.auto_shoot = (want.auto and aim.on) and true or false
    end
    local function profileToggle(key)
        return function(v)
            local oldTap, oldRapid = aim.double_tap, aim.rapid
            aim[key] = v
            if type(profiles.on_apply)=="function" then pcall(profiles.on_apply, oldTap, oldRapid) end
        end
    end
    local function boxCount()
        local n=0
        for _,v in pairs(aim.boxes) do if v then n=n+1 end end
        return n
    end
    local statusRefresh = function() end

    local C = {
        accent = Color3.fromRGB(94,159,232),
        accent2 = Color3.fromRGB(150,120,245),
        text = Color3.fromRGB(238,241,247),
        dim = Color3.fromRGB(139,146,160),
        red = Color3.fromRGB(233,95,102),
        off = Color3.fromRGB(52,56,66),
        bg = Color3.fromRGB(16,17,21),
        stroke = Color3.fromRGB(44,48,58),
        card = Color3.fromRGB(25,27,33),
        cardHi = Color3.fromRGB(31,34,42),
    }
    local accent = C.accent

    enemy.box, enemy.name, enemy.hb = true, true, true
    enemy.boxCol = {accent,1}
    enemy.nCol = {Color3.fromRGB(245,247,250),1}
    enemy.hlCol = Color3.fromRGB(114,188,143)
    enemy.dyCol = Color3.fromRGB(233,115,102)
    enemy.boxGrd, enemy.nGrd, enemy.hbGrd = false, false, false
    friendly.en = false
    esp.shSet.useTeam = true
    aim.team_check = true
    aim.boxes = {head=true,chest=true}
    aim.prefer, aim.fov = "head", 8
    aim.draw_fov = false
    aim.fov_fill = false

    -- Old gameplay HUD/effects stay on the original GUI; the old menu itself is gone.
    local gui = assert(services.screen(2000), "DaDa: could not create ScreenGui")
    gui.Name = "DaDaFx"
    runtime.own(gui)

    local status = {Text=""}
    local function make(kind, props, parent)
        local item = Instance.new(kind)
        for k,v in pairs(props) do item[k]=v end
        item.Parent=parent
        return item
    end
    local function corner(item, radius)
        return make("UICorner", {CornerRadius=UDim.new(0,radius or 10)}, item)
    end
    local function stroke(item, color, thick, transp)
        return make("UIStroke", {Color=color or C.stroke, Thickness=thick or 1, Transparency=transp or 0,
            ApplyStrokeMode=Enum.ApplyStrokeMode.Border}, item)
    end
    local function gradient(item, c1, c2, rot)
        return make("UIGradient", {Color=ColorSequence.new(c1,c2), Rotation=rot or 0}, item)
    end
    local function label(parent, text, position, size, textSize, color, font)
        return make("TextLabel", {
            BackgroundTransparency=1, Text=text, Position=position, Size=size,
            Font=font or Enum.Font.Gotham, TextSize=textSize or 14,
            TextColor3=color or C.text,
            TextXAlignment=Enum.TextXAlignment.Left, BorderSizePixel=0,
        },parent)
    end
    local function tween(item, props, t)
        local ok = pcall(function()
            services.tween:Create(item, TweenInfo.new(t or 0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
        end)
        if not ok then for k,v in pairs(props) do pcall(function() item[k]=v end) end end
    end

    ------------------------------------------------------------------ FOV ring
    local ringColors = {
        {"Синий", accent}, {"Белый", Color3.fromRGB(245,247,250)},
        {"Красный", C.red}, {"Зелёный", Color3.fromRGB(114,188,143)},
        {"Фиолет", C.accent2},
    }
    local ringIndex = 1
    local ring = make("Frame", {
        Name="FovRing", AnchorPoint=Vector2.new(0.5,0.5), Position=UDim2.fromScale(0.5,0.5),
        Size=UDim2.fromOffset(0,0), BackgroundColor3=accent, BackgroundTransparency=1,
        BorderSizePixel=0, Visible=false, Active=false,
    }, gui)
    corner(ring, 9999)
    local ringStroke = make("UIStroke", {Color=accent, Thickness=1.5}, ring)
    local function updateRing()
        local show = aim.draw_fov and aim.on
        ring.Visible = show and true or false
        if not show then return end
        local camera = services.workspace.CurrentCamera
        if not camera then return end
        local v = camera.ViewportSize
        local half = math.rad(math.clamp(tonumber(aim.fov) or 8, 0.1, 179) / 2)
        local camHalf = math.rad(math.clamp(camera.FieldOfView, 1, 120) / 2)
        local r = math.min(math.tan(half) / math.tan(camHalf) * v.Y / 2, v.Magnitude)
        ring.Size = UDim2.fromOffset(r*2, r*2)
        local col = ringColors[ringIndex][2]
        ringStroke.Color = col
        ring.BackgroundColor3 = col
        ring.BackgroundTransparency = aim.fov_fill and 0.88 or 1
    end


    ------------------------------------------------------------------ effects engine
    local palette = {
        {"Синий", accent}, {"Белый", Color3.fromRGB(245,247,250)},
        {"Красный", C.red}, {"Зелёный", Color3.fromRGB(114,188,143)},
        {"Фиолет", C.accent2}, {"Жёлтый", Color3.fromRGB(255,214,102)},
        {"Радуга", Color3.new(1,1,1)},
    }
    local paletteOptions = {}
    for i,c in ipairs(palette) do paletteOptions[i]={i,c[1]} end
    local function pickColor(idx)
        if idx==#palette then return Color3.fromHSV((os.clock()*0.45)%1,0.75,1) end
        return palette[idx][2]
    end
    local vis = {
        tracer=false, tracerAll=true, tracerTime=1.5, tracerWidth=0.15, tracerColor=1,
        impact=false, hitmarker=false, dmgnum=false,
        crosshair=false, chSize=8, chGap=4, chThick=2, chColor=2, chDot=false,
        info=false, bright=false, nofog=false, camfov=false, camfovVal=90,
        chams=false, chamsWall=true, chamsFill=0.5, chamsOutline=0, chamsColor=3, chamsOutCol=2,
        snap=false, skel=false, snapOrigin=1, lineColor=2, lineThick=1,
        radar=false, radarRange=200, radarSize=150, plist=false,
        hitsound=false, hitSound=1, hitVol=1.5, hitPitch=1,
        killfx=false, killStyle=1, killColor=3, killsound=false, killSoundIdx=5,
        tp=false, tpKey=true, tpDist=10, tpHeight=1.5, tpShoulder=0, tpColl=true, tpBody=true,
    }
    local fxFolder = Instance.new("Folder")
    fxFolder.Name = "DaDaFx"
    do
        local ok = pcall(function() fxFolder.Parent = services.workspace.CurrentCamera end)
        if not ok then pcall(function() fxFolder.Parent = services.workspace end) end
    end
    runtime.own(fxFolder)

    local function spawnTracer(a, b)
        local d = b - a
        local len = d.Magnitude
        if len < 0.5 then return end
        local w = vis.tracerWidth
        local p = Instance.new("Part")
        p.Anchored, p.CanCollide, p.CanQuery, p.CanTouch, p.CastShadow = true, false, false, false, false
        p.Material = Enum.Material.Neon
        p.Color = pickColor(vis.tracerColor)
        p.Transparency = 0.1
        p.Size = Vector3.new(w, w, len)
        local up = math.abs(d.Unit.Y) > 0.999 and Vector3.new(1,0,0) or Vector3.new(0,1,0)
        p.CFrame = CFrame.lookAt(a + d/2, b, up)
        p.Parent = fxFolder
        tween(p, {Transparency=1, Size=Vector3.new(w*0.2, w*0.2, len)}, vis.tracerTime)
        services.debris:AddItem(p, vis.tracerTime + 0.2)
    end
    local function spawnImpact(pos)
        local p = Instance.new("Part")
        p.Shape = Enum.PartType.Ball
        p.Anchored, p.CanCollide, p.CanQuery, p.CanTouch, p.CastShadow = true, false, false, false, false
        p.Material = Enum.Material.Neon
        p.Color = pickColor(vis.tracerColor)
        p.Transparency = 0.1
        p.Size = Vector3.new(0.5,0.5,0.5)
        p.Position = pos
        p.Parent = fxFolder
        tween(p, {Transparency=1, Size=Vector3.new(1.8,1.8,1.8)}, 0.55)
        services.debris:AddItem(p, 0.7)
    end
    local function spawnDamage(pos, dmg)
        local p = Instance.new("Part")
        p.Anchored, p.CanCollide, p.CanQuery, p.CanTouch, p.CastShadow = true, false, false, false, false
        p.Transparency = 1
        p.Size = Vector3.new(0.2,0.2,0.2)
        p.Position = pos + Vector3.new(0,1,0)
        p.Parent = fxFolder
        local bb = Instance.new("BillboardGui")
        bb.Size = UDim2.fromOffset(90,32)
        bb.AlwaysOnTop = true
        bb.Parent = p
        local t = make("TextLabel", {
            Size=UDim2.fromScale(1,1), BackgroundTransparency=1,
            Text=tostring(math.floor(dmg+0.5)), Font=Enum.Font.GothamBlack, TextSize=24,
            TextColor3=Color3.fromRGB(255,214,102), TextStrokeTransparency=0.35,
            TextStrokeColor3=Color3.new(0,0,0),
        }, bb)
        tween(p, {Position=pos + Vector3.new(0,3.2,0)}, 0.9)
        tween(t, {TextTransparency=1, TextStrokeTransparency=1}, 0.9)
        services.debris:AddItem(p, 1.1)
    end

    -- hit marker (screen centre)
    local hmHolder = make("Frame", {
        AnchorPoint=Vector2.new(0.5,0.5), Position=UDim2.fromScale(0.5,0.5),
        Size=UDim2.fromOffset(0,0), BackgroundTransparency=1, Active=false,
    }, gui)
    local hmBars = {}
    for i,o in ipairs({{-9,-9,45},{9,9,45},{9,-9,-45},{-9,9,-45}}) do
        hmBars[i] = make("Frame", {
            AnchorPoint=Vector2.new(0.5,0.5), Position=UDim2.fromOffset(o[1],o[2]),
            Size=UDim2.fromOffset(11,2), Rotation=o[3], BackgroundColor3=Color3.new(1,1,1),
            BackgroundTransparency=1, BorderSizePixel=0,
        }, hmHolder)
    end
    local function flashHitmarker()
        for _,b in ipairs(hmBars) do
            b.BackgroundTransparency = 0
            b.BackgroundColor3 = Color3.new(1,1,1)
            tween(b, {BackgroundTransparency=1}, 0.4)
        end
    end

    -- custom crosshair
    local ch = make("Frame", {
        AnchorPoint=Vector2.new(0.5,0.5), Position=UDim2.fromScale(0.5,0.5),
        Size=UDim2.fromOffset(0,0), BackgroundTransparency=1, Visible=false, Active=false,
    }, gui)
    local chBars = {}
    for i=1,4 do
        chBars[i] = make("Frame", {AnchorPoint=Vector2.new(0.5,0.5), BorderSizePixel=0, BackgroundColor3=Color3.new(1,1,1)}, ch)
    end
    local chDot = make("Frame", {AnchorPoint=Vector2.new(0.5,0.5), BorderSizePixel=0, BackgroundColor3=Color3.new(1,1,1)}, ch)
    corner(chDot, 9)
    local function layoutCross()
        local s,g,t = vis.chSize, vis.chGap, vis.chThick
        local off = g + s/2
        chBars[1].Size, chBars[1].Position = UDim2.fromOffset(t,s), UDim2.fromOffset(0,-off)
        chBars[2].Size, chBars[2].Position = UDim2.fromOffset(t,s), UDim2.fromOffset(0,off)
        chBars[3].Size, chBars[3].Position = UDim2.fromOffset(s,t), UDim2.fromOffset(-off,0)
        chBars[4].Size, chBars[4].Position = UDim2.fromOffset(s,t), UDim2.fromOffset(off,0)
        chDot.Size = UDim2.fromOffset(t+1,t+1)
        chDot.Visible = vis.chDot
        ch.Visible = vis.crosshair
    end
    layoutCross()

    -- FPS / ping pill
    local info = make("Frame", {
        AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1,-14,0,10), Size=UDim2.fromOffset(214,28),
        BackgroundColor3=C.bg, BackgroundTransparency=0.12, BorderSizePixel=0, Visible=false, Active=false,
    }, gui)
    corner(info, 14); stroke(info, C.stroke, 1)
    local infoText = label(info, "", UDim2.new(), UDim2.fromScale(1,1), 12, C.text, Enum.Font.GothamBold)
    infoText.TextXAlignment = Enum.TextXAlignment.Center
    gradient(infoText, C.accent, C.accent2, 0)

    -- world: fullbright / no fog / camera fov (restores originals on disable)
    local lighting = services.lighting
    local atmosphere = lighting:FindFirstChildOfClass("Atmosphere")
    local orig = {
        Brightness=lighting.Brightness, ClockTime=lighting.ClockTime, GlobalShadows=lighting.GlobalShadows,
        Ambient=lighting.Ambient, OutdoorAmbient=lighting.OutdoorAmbient,
        FogEnd=lighting.FogEnd, FogStart=lighting.FogStart,
        Density=atmosphere and atmosphere.Density or nil,
    }
    local function restoreBright()
        pcall(function()
            lighting.Brightness, lighting.ClockTime, lighting.GlobalShadows = orig.Brightness, orig.ClockTime, orig.GlobalShadows
            lighting.Ambient, lighting.OutdoorAmbient = orig.Ambient, orig.OutdoorAmbient
        end)
    end
    local function restoreFog()
        pcall(function()
            lighting.FogEnd, lighting.FogStart = orig.FogEnd, orig.FogStart
            if atmosphere and orig.Density then atmosphere.Density = orig.Density end
        end)
    end

    -- ===== players helpers =====
    local lp = services.players.LocalPlayer
    local green = Color3.fromRGB(114,188,143)
    local function allyOf(p)
        return esp.shSet.useTeam and lp.Team ~= nil and p.Team == lp.Team
    end
    local function shown(p)
        if p == lp then return false end
        if allyOf(p) and not friendly.en then return false end
        return true
    end
    local function charParts(p)
        local ch = p.Character
        if not ch then return nil end
        local hum = ch:FindFirstChildOfClass("Humanoid")
        local root = ch:FindFirstChild("HumanoidRootPart")
        if not hum or not root or hum.Health <= 0 then return nil end
        return ch, hum, root
    end

    -- ===== chams =====
    local highlights = {}
    local function clearChams()
        for p,h in pairs(highlights) do
            pcall(function() h:Destroy() end)
            highlights[p] = nil
        end
    end
    local function updateChams()
        if not vis.chams then
            if next(highlights) then clearChams() end
            return
        end
        for _,p in ipairs(services.players:GetPlayers()) do
            local ch = nil
            if shown(p) then ch = charParts(p) end
            local h = highlights[p]
            if ch then
                if not h or not h.Parent then
                    h = Instance.new("Highlight")
                    h.Parent = fxFolder
                    highlights[p] = h
                end
                local ally = allyOf(p)
                h.Adornee = ch
                h.FillColor = ally and green or pickColor(vis.chamsColor)
                h.OutlineColor = ally and green or pickColor(vis.chamsOutCol)
                h.FillTransparency = vis.chamsFill
                h.OutlineTransparency = vis.chamsOutline
                h.DepthMode = vis.chamsWall and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
                h.Enabled = true
            elseif h then
                pcall(function() h:Destroy() end)
                highlights[p] = nil
            end
        end
        for p,h in pairs(highlights) do
            if not p.Parent then
                pcall(function() h:Destroy() end)
                highlights[p] = nil
            end
        end
    end

    -- ===== snaplines / skeleton =====
    local immediate = painter.immediate
    local linePool, lineUsed = {}, 0
    local function line(a, b, col, th)
        if immediate then
            painter.line(a, b, col, 1, th)
            return
        end
        lineUsed = lineUsed + 1
        local l = linePool[lineUsed]
        if not l then
            l = Drawing.new("Line")
            linePool[lineUsed] = l
        end
        l.From, l.To, l.Color, l.Thickness, l.Transparency, l.Visible = a, b, col, th, 1, true
    end
    local function hideLines()
        for i = lineUsed + 1, #linePool do linePool[i].Visible = false end
    end
    local function removeLines()
        for i,l in ipairs(linePool) do
            pcall(function() l:Remove() end)
            linePool[i] = nil
        end
    end
    local R15 = {
        {"Head","UpperTorso"},{"UpperTorso","LowerTorso"},
        {"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},
        {"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},
        {"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},
        {"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},
    }
    local R6 = {{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"}}
    local function drawLines()
        local cam = services.workspace.CurrentCamera
        if not cam or not (vis.snap or vis.skel) then return end
        local v = cam.ViewportSize
        local origin
        if vis.snapOrigin == 1 then origin = Vector2.new(v.X/2, v.Y)
        elseif vis.snapOrigin == 2 then origin = Vector2.new(v.X/2, v.Y/2)
        else origin = Vector2.new(v.X/2, 0) end
        for _,p in ipairs(services.players:GetPlayers()) do
            if shown(p) then
                local ch, hum, root = charParts(p)
                if ch then
                    local col = allyOf(p) and green or pickColor(vis.lineColor)
                    if vis.snap then
                        local pt, on = cam:WorldToViewportPoint(root.Position)
                        if on then line(origin, Vector2.new(pt.X, pt.Y), col, vis.lineThick) end
                    end
                    if vis.skel then
                        local set = ch:FindFirstChild("UpperTorso") and R15 or R6
                        for _,pair in ipairs(set) do
                            local a, b = ch:FindFirstChild(pair[1]), ch:FindFirstChild(pair[2])
                            if a and b then
                                local pa, oa = cam:WorldToViewportPoint(a.Position)
                                local pb, ob = cam:WorldToViewportPoint(b.Position)
                                if oa and ob then
                                    line(Vector2.new(pa.X, pa.Y), Vector2.new(pb.X, pb.Y), col, vis.lineThick)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if immediate then
        local okc, conn = pcall(function()
            return DrawingImmediate.GetPaint(0):Connect(function() pcall(drawLines) end)
        end)
        if okc and conn then runtime.adopt(conn) end
    end

    -- ===== radar =====
    local radar = make("Frame", {
        Position=UDim2.fromOffset(14,138), Size=UDim2.fromOffset(vis.radarSize, vis.radarSize),
        BackgroundColor3=C.bg, BackgroundTransparency=0.18, BorderSizePixel=0, Visible=false, Active=false,
    }, gui)
    corner(radar, 9999); stroke(radar, C.stroke, 1)
    make("Frame", {AnchorPoint=Vector2.new(0.5,0.5), Position=UDim2.fromScale(0.5,0.5),
        Size=UDim2.new(1,-14,0,1), BackgroundColor3=C.stroke, BorderSizePixel=0}, radar)
    make("Frame", {AnchorPoint=Vector2.new(0.5,0.5), Position=UDim2.fromScale(0.5,0.5),
        Size=UDim2.new(0,1,1,-14), BackgroundColor3=C.stroke, BorderSizePixel=0}, radar)
    make("Frame", {AnchorPoint=Vector2.new(0.5,0.5), Position=UDim2.fromScale(0.5,0.5),
        Size=UDim2.fromOffset(8,8), BackgroundColor3=accent, Rotation=45, BorderSizePixel=0}, radar)
    local radarDots = {}
    for i=1,40 do
        radarDots[i] = make("Frame", {AnchorPoint=Vector2.new(0.5,0.5), Size=UDim2.fromOffset(7,7),
            BorderSizePixel=0, Visible=false}, radar)
        corner(radarDots[i], 4)
    end
    local function updateRadar()
        radar.Visible = vis.radar
        if not vis.radar then return end
        local size = vis.radarSize
        radar.Size = UDim2.fromOffset(size, size)
        local cam = services.workspace.CurrentCamera
        if not cam then return end
        local cf = cam.CFrame
        local rv = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z)
        local fv = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z)
        if rv.Magnitude < 1e-3 or fv.Magnitude < 1e-3 then return end
        rv, fv = rv.Unit, fv.Unit
        local half = size/2 - 6
        local myRoot = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        local myPos = myRoot and myRoot.Position or cf.Position
        local n = 0
        for _,p in ipairs(services.players:GetPlayers()) do
            if n < #radarDots and shown(p) then
                local ch, hum, root = charParts(p)
                if ch then
                    local d = root.Position - myPos
                    local x = d:Dot(rv) / vis.radarRange * half
                    local y = -d:Dot(fv) / vis.radarRange * half
                    local mag = math.sqrt(x*x + y*y)
                    local edge = false
                    if mag > half then x, y, edge = x/mag*half, y/mag*half, true end
                    n = n + 1
                    local dot = radarDots[n]
                    dot.Visible = true
                    dot.Position = UDim2.new(0.5, x, 0.5, y)
                    dot.BackgroundColor3 = allyOf(p) and green or C.red
                    dot.BackgroundTransparency = edge and 0.55 or 0
                end
            end
        end
        for i = n+1, #radarDots do radarDots[i].Visible = false end
    end

    -- ===== player list =====
    local plist = make("Frame", {
        AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1,-14,0,46), Size=UDim2.fromOffset(224,30),
        BackgroundColor3=C.bg, BackgroundTransparency=0.15, BorderSizePixel=0, Visible=false, Active=false,
    }, gui)
    corner(plist, 10); stroke(plist, C.stroke, 1)
    label(plist, "ИГРОКИ", UDim2.fromOffset(12,6), UDim2.fromOffset(120,16), 10, C.dim, Enum.Font.GothamBold)
    local plRows = {}
    for i=1,8 do
        local nm = label(plist, "", UDim2.fromOffset(12, 22+(i-1)*19), UDim2.fromOffset(112,18), 12, C.text, Enum.Font.GothamMedium)
        nm.TextTruncate = Enum.TextTruncate.AtEnd
        local st = label(plist, "", UDim2.fromOffset(112, 22+(i-1)*19), UDim2.fromOffset(100,18), 12, C.text, Enum.Font.GothamBold)
        st.TextXAlignment = Enum.TextXAlignment.Right
        plRows[i] = {nm, st}
    end
    local function updateList()
        plist.Visible = vis.plist
        if not vis.plist then return end
        local myRoot = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        local myPos = myRoot and myRoot.Position or Vector3.new()
        local rows = {}
        for _,p in ipairs(services.players:GetPlayers()) do
            if shown(p) then
                local ch, hum, root = charParts(p)
                if ch then
                    rows[#rows+1] = {p=p, dist=(root.Position-myPos).Magnitude, hp=hum.Health, max=math.max(hum.MaxHealth,1)}
                end
            end
        end
        table.sort(rows, function(a,b) return a.dist < b.dist end)
        for i=1,#plRows do
            local r, ui = rows[i], plRows[i]
            if r then
                ui[1].Text = r.p.Name
                ui[1].TextColor3 = allyOf(r.p) and green or C.text
                ui[2].Text = string.format("%dм · %d", math.floor(r.dist+0.5), math.floor(r.hp+0.5))
                local f = math.clamp(r.hp / r.max, 0, 1)
                ui[2].TextColor3 = Color3.fromRGB(233,95,102):Lerp(green, f)
                ui[1].Visible, ui[2].Visible = true, true
            else
                ui[1].Visible, ui[2].Visible = false, false
            end
        end
        plist.Size = UDim2.fromOffset(224, 30 + math.min(#rows,#plRows)*19)
    end

    -- ===== sounds / kill effects =====
    local soundList = {
        {1,"Пинг","rbxasset://sounds/electronicpingshort.wav"},
        {2,"Щелчок","rbxasset://sounds/snap.mp3"},
        {3,"Бас","rbxasset://sounds/bass.mp3"},
        {4,"Клик","rbxasset://sounds/clickfast.wav"},
        {5,"Уф","rbxasset://sounds/uuhhh.mp3"},
        {6,"Splat","rbxasset://sounds/splat.wav"},
    }
    local soundOptions = {}
    for i,s in ipairs(soundList) do soundOptions[i] = {i, s[2]} end
    local function playSound(idx, vol, pitch)
        pcall(function()
            local s = Instance.new("Sound")
            s.SoundId = soundList[idx][3]
            s.Volume = vol
            s.PlaybackSpeed = pitch or 1
            s.Parent = services.sounds
            s:Play()
            services.debris:AddItem(s, 4)
        end)
    end
    local function newFxPart(pos, size, shape)
        local p = Instance.new("Part")
        if shape then p.Shape = shape end
        p.Anchored, p.CanCollide, p.CanQuery, p.CanTouch, p.CastShadow = true, false, false, false, false
        p.Material = Enum.Material.Neon
        p.Color = pickColor(vis.killColor)
        p.Size = size
        p.Position = pos
        p.Parent = fxFolder
        return p
    end
    local function killBurst(pos)
        for i=1,16 do
            local p = newFxPart(pos, Vector3.new(0.4,0.4,0.4), Enum.PartType.Ball)
            local dir = Vector3.new(math.random()-0.5, math.random()*0.8+0.1, math.random()-0.5).Unit
            tween(p, {Position=pos + dir*(5+math.random()*5), Transparency=1, Size=Vector3.new(0.1,0.1,0.1)}, 0.75)
            services.debris:AddItem(p, 0.9)
        end
        local core = newFxPart(pos, Vector3.new(1,1,1), Enum.PartType.Ball)
        tween(core, {Size=Vector3.new(7,7,7), Transparency=1}, 0.5)
        services.debris:AddItem(core, 0.7)
    end
    local function killRing(pos)
        for i=1,2 do
            local p = newFxPart(pos - Vector3.new(0,2.5,0), Vector3.new(0.2,1,1), Enum.PartType.Cylinder)
            p.CFrame = CFrame.new(pos - Vector3.new(0,2.5,0)) * CFrame.Angles(0,0,math.pi/2)
            p.Transparency = 0.1
            tween(p, {Size=Vector3.new(0.2,10+i*5,10+i*5), Transparency=1}, 0.5+i*0.25)
            services.debris:AddItem(p, 1.2)
        end
        local beam = newFxPart(pos + Vector3.new(0,4,0), Vector3.new(0.3,14,0.3))
        tween(beam, {Size=Vector3.new(0.05,14,0.05), Transparency=1}, 0.8)
        services.debris:AddItem(beam, 1)
    end
    local function killText(pos)
        local p = Instance.new("Part")
        p.Anchored, p.CanCollide, p.CanQuery, p.CanTouch, p.CastShadow = true, false, false, false, false
        p.Transparency = 1
        p.Size = Vector3.new(0.2,0.2,0.2)
        p.Position = pos + Vector3.new(0,2,0)
        p.Parent = fxFolder
        local bb = Instance.new("BillboardGui")
        bb.Size = UDim2.fromOffset(120,40)
        bb.AlwaysOnTop = true
        bb.Parent = p
        local t = make("TextLabel", {
            Size=UDim2.fromScale(1,1), BackgroundTransparency=1, Text="KILL",
            Font=Enum.Font.GothamBlack, TextSize=30, TextColor3=pickColor(vis.killColor),
            TextStrokeTransparency=0.3, TextStrokeColor3=Color3.new(0,0,0),
        }, bb)
        tween(p, {Position=pos + Vector3.new(0,5,0)}, 1.1)
        tween(t, {TextTransparency=1, TextStrokeTransparency=1}, 1.1)
        services.debris:AddItem(p, 1.3)
    end
    local killed = setmetatable({}, {__mode="k"})
    local function doKill(pos)
        if vis.killsound then playSound(vis.killSoundIdx, vis.hitVol, 1) end
        if vis.killfx then
            if vis.killStyle == 1 then killBurst(pos) else killRing(pos) end
            killText(pos)
        end
    end
    local function watchKill(char, hit)
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 or killed[char] then return end
        task.spawn(function()
            for i=1,7 do
                task.wait(0.12)
                if hum.Health <= 0 then
                    if not killed[char] then
                        killed[char] = true
                        local r = char:FindFirstChild("HumanoidRootPart")
                        doKill(r and r.Position or hit)
                    end
                    return
                end
            end
        end)
    end

    -- ===== third person =====
    local tpOrig, tpApplied, tpParts, tpPartsT = nil, nil, {}, 0
    local function tpUndo()
        local cam = services.workspace.CurrentCamera
        if cam and tpApplied and tpOrig and cam.CFrame == tpApplied then cam.CFrame = tpOrig end
        tpApplied = nil
    end
    local function tpApply()
        if not vis.tp then return end
        local cam = services.workspace.CurrentCamera
        local ch = lp.Character
        local head = ch and ch:FindFirstChild("Head")
        if not cam or not head then return end
        local cf = cam.CFrame
        tpOrig = cf
        local from = cf.Position
        local target = from - cf.LookVector*vis.tpDist + cf.UpVector*vis.tpHeight + cf.RightVector*vis.tpShoulder
        if vis.tpColl then
            local params = RaycastParams.new()
            params.FilterType = Enum.RaycastFilterType.Exclude
            params.FilterDescendantsInstances = {ch, fxFolder, cam}
            params.RespectCanCollide = true
            local dir = target - from
            local r = services.workspace:Raycast(from, dir, params)
            if r then target = from + dir.Unit * math.max(r.Distance - 0.7, 0.3) end
        end
        cam.CFrame = CFrame.new(target) * cf.Rotation
        tpApplied = cam.CFrame
        if vis.tpBody then
            local now = os.clock()
            if now - tpPartsT > 1 then
                tpPartsT = now
                tpParts = {}
                for _,d in ipairs(ch:GetDescendants()) do
                    if d:IsA("BasePart") then tpParts[#tpParts+1] = d end
                end
            end
            for _,pt in ipairs(tpParts) do pcall(function() pt.LocalTransparencyModifier = 0 end) end
        end
    end
    local function fxCleanup()
        vis.chams, vis.tp = false, false
        clearChams()
        removeLines()
        tpUndo()
    end

    local lastTracerAt, fpsAvg, infoTimer, listTimer = 0, 60, 0, 0
    local function muzzle(origin, cam)
        local cf = cam.CFrame
        if (origin - cf.Position).Magnitude < 4 then
            return origin + cf.RightVector*0.7 - cf.UpVector*0.45 + cf.LookVector*1.2
        end
        return origin
    end
    aim.on_shot = function(origin, hit, part, dmg, char)
        lastTracerAt = os.clock()
        local cam = services.workspace.CurrentCamera
        if typeof(origin)~="Vector3" or typeof(hit)~="Vector3" or not cam then return end
        if vis.tracer then spawnTracer(muzzle(origin, cam), hit) end
        if vis.impact then spawnImpact(hit) end
        if vis.hitmarker then flashHitmarker() end
        if vis.dmgnum and type(dmg)=="number" and dmg>0 then spawnDamage(hit, dmg) end
        if vis.hitsound then playSound(vis.hitSound, vis.hitVol, vis.hitPitch) end
        if (vis.killfx or vis.killsound) and typeof(char)=="Instance" then watchKill(char, hit) end
    end
    aim.on_send = function()
        if not (vis.tracer and vis.tracerAll) then return end
        local t0 = os.clock()
        task.delay(0.06, function()
            if math.abs(lastTracerAt - t0) < 0.2 then return end
            local cam = services.workspace.CurrentCamera
            if not cam then return end
            local lp = services.players.LocalPlayer
            local params = RaycastParams.new()
            params.FilterType = Enum.RaycastFilterType.Exclude
            params.FilterDescendantsInstances = {lp and lp.Character or nil, fxFolder}
            local o, dir = cam.CFrame.Position, cam.CFrame.LookVector * 600
            local r = services.workspace:Raycast(o, dir, params)
            spawnTracer(muzzle(o, cam), r and r.Position or (o + dir))
        end)
    end

    local function effectsStep(dt)
        ch.Visible = vis.crosshair and true or false
        chDot.Visible = vis.chDot and true or false
        updateChams()
        updateRadar()
        listTimer = listTimer + dt
        if listTimer > 0.25 then listTimer = 0 updateList() end
        if not immediate then
            lineUsed = 0
            pcall(drawLines)
            hideLines()
        end
        if vis.crosshair and vis.chColor == #palette then
            local col = pickColor(vis.chColor)
            for _,b in ipairs(chBars) do b.BackgroundColor3 = col end
            chDot.BackgroundColor3 = col
        end
        if vis.bright then
            lighting.Brightness, lighting.ClockTime, lighting.GlobalShadows = 2, 14, false
            lighting.Ambient, lighting.OutdoorAmbient = Color3.fromRGB(170,170,170), Color3.fromRGB(170,170,170)
        end
        if vis.nofog then
            lighting.FogEnd, lighting.FogStart = 1e9, 1e9
            if atmosphere then atmosphere.Density = 0 end
        end
        local cam = services.workspace.CurrentCamera
        if vis.camfov and cam then cam.FieldOfView = vis.camfovVal end
        if vis.info then
            fpsAvg = fpsAvg + ((1/math.max(dt,1/1000)) - fpsAvg) * 0.08
            infoTimer = infoTimer + dt
            if infoTimer > 0.4 then
                infoTimer = 0
                local ping = 0
                pcall(function() ping = services.stats.Network.ServerStatsItem["Data Ping"]:GetValue() end)
                infoText.Text = string.format("DaDa  |  %d FPS  |  %d ms", math.floor(fpsAvg+0.5), math.floor(ping+0.5))
            end
        end
    end


    -- Inject the supplied menu_ui library; the previous DaDa menu is removed completely.
    --[[
        Универсальное меню (только интерфейс, без игровых функций)
        Вкладки, переключатели, слайдеры, выпадающие списки, кнопки, метки.
        Перетаскивание (мышь и тач), кнопка-значок для телефона, клавиша RightShift.
        Внизу файла - демо. Замените его на свои вкладки и коллбэки.
    ]]

    local Players = game:GetService("Players")
    local UIS = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local RunService = game:GetService("RunService")
    local Stats = game:GetService("Stats")

    local Library = {}
    Library.__index = Library

    local THEME = {
        Bg = Color3.fromRGB(20, 20, 26),
        Panel = Color3.fromRGB(28, 28, 36),
        Item = Color3.fromRGB(38, 38, 48),
        Accent = Color3.fromRGB(120, 90, 255),
        Text = Color3.fromRGB(235, 235, 245),
        SubText = Color3.fromRGB(150, 150, 165),
    }

    local function new(class, props, children)
        local o = Instance.new(class)
        for k, v in pairs(props or {}) do o[k] = v end
        for _, c in ipairs(children or {}) do c.Parent = o end
        return o
    end

    local function corner(r) return new("UICorner", { CornerRadius = UDim.new(0, r or 8) }) end

    local function getParent()
        local ok, ui = pcall(function() return gethui and gethui() end)
        if ok and ui then return ui end
        local ok2, core = pcall(function() return game:GetService("CoreGui") end)
        if ok2 and core then
            local test = pcall(function() return core.Name end)
            if test then return core end
        end
        return Players.LocalPlayer:WaitForChild("PlayerGui")
    end

    local function tween(obj, props, t)
        TweenService:Create(obj, TweenInfo.new(t or 0.15, Enum.EasingStyle.Quad), props):Play()
    end

    local function makeDraggable(handle, target, scaleObj)
        local dragging, startPos, startInput
        handle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                startPos = target.Position
                startInput = input.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end)
        UIS.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
                or input.UserInputType == Enum.UserInputType.Touch) then
                local d = (input.Position - startInput) / (scaleObj and scaleObj.Scale or 1)
                target.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X,
                    startPos.Y.Scale, startPos.Y.Offset + d.Y)
            end
        end)
    end

    function Library.new(title, toggleKey)
        local self = setmetatable({}, Library)
        self.Tabs = {}
        self.Current = nil
        toggleKey = toggleKey or Enum.KeyCode.RightShift

        local gui = new("ScreenGui", {
            Name = "MenuUI_" .. tostring(math.random(1000, 9999)),
            ResetOnSpawn = false,
            IgnoreGuiInset = true,
            DisplayOrder = 999,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        })
        pcall(function() if syn and syn.protect_gui then syn.protect_gui(gui) end end)
        gui.Parent = getParent()
        self.Gui = gui

        local main = new("Frame", {
            Size = UDim2.fromOffset(460, 320),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = THEME.Bg,
            BorderSizePixel = 0,
            Visible = false,
            Parent = gui,
        }, { corner(10) })
        self.Main = main

        -- адаптация под экран телефона: окно само уменьшается, чтобы влезть
        local uiScale = new("UIScale", { Parent = main })
        local function fit()
            local cam = workspace.CurrentCamera
            if not cam then return end
            local vp = cam.ViewportSize
            uiScale.Scale = math.clamp(math.min((vp.X - 16) / 460, (vp.Y - 16) / 320), 0.5, 1)
        end
        fit()
        pcall(function()
            workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fit)
        end)

        local top = new("Frame", {
            Size = UDim2.new(1, 0, 0, 36),
            BackgroundColor3 = THEME.Panel,
            BorderSizePixel = 0,
            Parent = main,
        }, { corner(10) })
        new("TextLabel", {
            Size = UDim2.new(1, -50, 1, 0),
            Position = UDim2.fromOffset(14, 0),
            BackgroundTransparency = 1,
            Text = title or "Menu",
            TextColor3 = THEME.Text,
            Font = Enum.Font.GothamBold,
            TextSize = 15,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = top,
        })
        local close = new("TextButton", {
            Size = UDim2.fromOffset(28, 28),
            Position = UDim2.new(1, -34, 0, 4),
            BackgroundColor3 = THEME.Item,
            Text = "-",
            TextColor3 = THEME.Text,
            Font = Enum.Font.GothamBold,
            TextSize = 18,
            Parent = top,
        }, { corner(6) })
        makeDraggable(top, main, uiScale)

        local tabBar = new("ScrollingFrame", {
            Size = UDim2.new(0, 120, 1, -46),
            Position = UDim2.fromOffset(8, 42),
            BackgroundColor3 = THEME.Panel,
            BorderSizePixel = 0,
            ScrollBarThickness = 0,
            CanvasSize = UDim2.new(),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Parent = main,
        }, {
            corner(8),
            new("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }),
            new("UIPadding", { PaddingTop = UDim.new(0, 6), PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6) }),
        })
        self.TabBar = tabBar

        self.Pages = new("Frame", {
            Size = UDim2.new(1, -144, 1, -46),
            Position = UDim2.fromOffset(136, 42),
            BackgroundTransparency = 1,
            Parent = main,
        })

        -- верхняя панель: D | FPS | ping | ник. Нажатие открывает/закрывает меню
        local lp = Players.LocalPlayer
        local bar = new("TextButton", {
            Name = "Hotbar",
            AutoButtonColor = false,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0, 8),
            Size = UDim2.fromOffset(0, 30),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = THEME.Bg,
            BackgroundTransparency = 0.1,
            BorderSizePixel = 0,
            Text = "",
            Parent = gui,
        }, {
            corner(8),
            new("UIStroke", { Color = THEME.Accent, Thickness = 1, Transparency = 0.3 }),
            new("UIPadding", { PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) }),
            new("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
        })

        local function cell(text, color, order)
            return new("TextLabel", {
                Size = UDim2.fromOffset(0, 30),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                Text = text,
                TextColor3 = color or THEME.Text,
                Font = Enum.Font.GothamBold,
                TextSize = 13,
                LayoutOrder = order,
                Parent = bar,
            })
        end
        local function sep(order)
            return cell("|", THEME.SubText, order)
        end

        cell("D", THEME.Accent, 1)
        sep(2)
        local fpsLabel = cell("-- fps", THEME.Text, 3)
        sep(4)
        local pingLabel = cell("-- ms", THEME.Text, 5)
        sep(6)
        cell(lp.DisplayName ~= "" and lp.DisplayName or lp.Name, THEME.Text, 7)

        -- обновление FPS и ping
        local frames, acc = 0, 0
        local conn = RunService.RenderStepped:Connect(function(dt)
            frames += 1
            acc += dt
            if acc >= 0.5 then
                fpsLabel.Text = math.floor(frames / acc + 0.5) .. " fps"
                frames, acc = 0, 0
                local ok, ping = pcall(function()
                    return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
                end)
                pingLabel.Text = (ok and ping) and (math.floor(ping + 0.5) .. " ms") or "-- ms"
            end
        end)

        local function setVisible(v)
            main.Visible = v
        end
        local function toggle() setVisible(not main.Visible) end
        bar.MouseButton1Click:Connect(toggle)
        close.MouseButton1Click:Connect(toggle)
        UIS.InputBegan:Connect(function(input, gp)
            if not gp and input.KeyCode == toggleKey then toggle() end
        end)

        function self:Destroy() conn:Disconnect() gui:Destroy() end
        return self
    end

    function Library:AddTab(name)
        local tab = { Window = self }
        local btn = new("TextButton", {
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundColor3 = THEME.Item,
            Text = name,
            TextColor3 = THEME.SubText,
            Font = Enum.Font.GothamMedium,
            TextSize = 13,
            LayoutOrder = #self.Tabs + 1,
            Parent = self.TabBar,
        }, { corner(6) })

        local page = new("ScrollingFrame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 3,
            CanvasSize = UDim2.new(),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false,
            Parent = self.Pages,
        }, {
            new("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }),
            new("UIPadding", { PaddingRight = UDim.new(0, 6) }),
        })

        local function select()
            for _, t in ipairs(self.Tabs) do
                t.Page.Visible = false
                tween(t.Button, { BackgroundColor3 = THEME.Item, TextColor3 = THEME.SubText })
            end
            page.Visible = true
            tween(btn, { BackgroundColor3 = THEME.Accent, TextColor3 = Color3.new(1, 1, 1) })
        end
        btn.MouseButton1Click:Connect(select)

        tab.Page, tab.Button = page, btn
        table.insert(self.Tabs, tab)
        if #self.Tabs == 1 then select() end

        local function row(h)
            return new("Frame", {
                Size = UDim2.new(1, 0, 0, h or 34),
                BackgroundColor3 = THEME.Item,
                BorderSizePixel = 0,
                Parent = page,
            }, { corner(6) })
        end
        local function label(parent, text, size)
            return new("TextLabel", {
                Size = size or UDim2.new(1, -20, 1, 0),
                Position = UDim2.fromOffset(10, 0),
                BackgroundTransparency = 1,
                Text = text,
                TextColor3 = THEME.Text,
                Font = Enum.Font.Gotham,
                TextSize = 13,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = parent,
            })
        end

        function tab:AddLabel(text)
            local r = row(28)
            local l = label(r, text)
            l.TextColor3 = THEME.SubText
            return { Set = function(_, t) l.Text = t end }
        end

        function tab:AddButton(text, callback)
            local r = row()
            local b = new("TextButton", {
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                Text = text,
                TextColor3 = THEME.Text,
                Font = Enum.Font.GothamMedium,
                TextSize = 13,
                Parent = r,
            })
            b.MouseButton1Click:Connect(function()
                tween(r, { BackgroundColor3 = THEME.Accent }, 0.08)
                task.delay(0.12, function() tween(r, { BackgroundColor3 = THEME.Item }) end)
                if callback then task.spawn(callback) end
            end)
        end

        function tab:AddToggle(text, default, callback)
            local state = default and true or false
            local r = row()
            label(r, text, UDim2.new(1, -70, 1, 0))
            local track = new("Frame", {
                Size = UDim2.fromOffset(40, 20),
                Position = UDim2.new(1, -50, 0.5, -10),
                BackgroundColor3 = state and THEME.Accent or THEME.Panel,
                Parent = r,
            }, { new("UICorner", { CornerRadius = UDim.new(1, 0) }) })
            local knob = new("Frame", {
                Size = UDim2.fromOffset(16, 16),
                Position = state and UDim2.fromOffset(22, 2) or UDim2.fromOffset(2, 2),
                BackgroundColor3 = Color3.new(1, 1, 1),
                Parent = track,
            }, { new("UICorner", { CornerRadius = UDim.new(1, 0) }) })
            local hit = new("TextButton", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", Parent = r })
            local obj = {}
            function obj:Set(v)
                state = v and true or false
                tween(track, { BackgroundColor3 = state and THEME.Accent or THEME.Panel })
                tween(knob, { Position = state and UDim2.fromOffset(22, 2) or UDim2.fromOffset(2, 2) })
                if callback then task.spawn(callback, state) end
            end
            function obj:Get() return state end
            hit.MouseButton1Click:Connect(function() obj:Set(not state) end)
            return obj
        end

        function tab:AddSlider(text, min, max, default, callback, step)
            step = step or 1
            local value = math.clamp(default or min, min, max)
            local r = row(48)
            local title = label(r, text, UDim2.new(1, -70, 0, 24))
            local val = new("TextLabel", {
                Size = UDim2.fromOffset(56, 24),
                Position = UDim2.new(1, -66, 0, 0),
                BackgroundTransparency = 1,
                Text = tostring(value),
                TextColor3 = THEME.SubText,
                Font = Enum.Font.Gotham,
                TextSize = 13,
                TextXAlignment = Enum.TextXAlignment.Right,
                Parent = r,
            })
            local bar = new("Frame", {
                Size = UDim2.new(1, -20, 0, 6),
                Position = UDim2.new(0, 10, 0, 32),
                BackgroundColor3 = THEME.Panel,
                Parent = r,
            }, { new("UICorner", { CornerRadius = UDim.new(1, 0) }) })
            local fill = new("Frame", {
                Size = UDim2.fromScale((value - min) / (max - min), 1),
                BackgroundColor3 = THEME.Accent,
                Parent = bar,
            }, { new("UICorner", { CornerRadius = UDim.new(1, 0) }) })

            local obj = {}
            function obj:Set(v)
                v = math.clamp(math.floor(v / step + 0.5) * step, min, max)
                value = v
                fill.Size = UDim2.fromScale((v - min) / (max - min), 1)
                val.Text = tostring(v)
                if callback then task.spawn(callback, v) end
            end
            function obj:Get() return value end

            local dragging = false
            local function update(x)
                local a = math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                obj:Set(min + (max - min) * a)
            end
            bar.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    update(i.Position.X)
                end
            end)
            UIS.InputEnded:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)
            UIS.InputChanged:Connect(function(i)
                if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement
                    or i.UserInputType == Enum.UserInputType.Touch) then
                    update(i.Position.X)
                end
            end)
            return obj
        end

        function tab:AddDropdown(text, options, default, callback)
            local current = default or options[1]
            local open = false
            local r = row(34)
            r.ClipsDescendants = true
            label(r, text, UDim2.new(0.5, -10, 0, 34))
            local head = new("TextButton", {
                Size = UDim2.new(0.5, -10, 0, 26),
                Position = UDim2.new(0.5, 0, 0, 4),
                BackgroundColor3 = THEME.Panel,
                Text = tostring(current) .. "  v",
                TextColor3 = THEME.Text,
                Font = Enum.Font.Gotham,
                TextSize = 12,
                Parent = r,
            }, { corner(6) })
            local list = new("Frame", {
                Size = UDim2.new(0.5, -10, 0, #options * 26),
                Position = UDim2.new(0.5, 0, 0, 34),
                BackgroundTransparency = 1,
                Parent = r,
            }, { new("UIListLayout", { Padding = UDim.new(0, 0) }) })
            for _, opt in ipairs(options) do
                local o = new("TextButton", {
                    Size = UDim2.new(1, 0, 0, 26),
                    BackgroundColor3 = THEME.Panel,
                    Text = tostring(opt),
                    TextColor3 = THEME.SubText,
                    Font = Enum.Font.Gotham,
                    TextSize = 12,
                    Parent = list,
                })
                o.MouseButton1Click:Connect(function()
                    current = opt
                    head.Text = tostring(opt) .. "  v"
                    open = false
                    tween(r, { Size = UDim2.new(1, 0, 0, 34) })
                    if callback then task.spawn(callback, opt) end
                end)
            end
            head.MouseButton1Click:Connect(function()
                open = not open
                tween(r, { Size = UDim2.new(1, 0, 0, open and (38 + #options * 26) or 34) })
            end)
            return { Get = function() return current end }
        end

        return tab
    end
    -- DaDa compatibility layer: maps the original Block Strike controls to this UI.
    function Library:AddSlider(tab, text, minValue, maxValue, defaultValue, callback, step)
        local minV = tonumber(minValue) or 0
        local maxV = tonumber(maxValue) or 100
        local value = math.clamp(tonumber(defaultValue) or minV, minV, maxV)
        local stepV = tonumber(step) or 1

        local r = Instance.new("Frame")
        r.Size = UDim2.new(1, 0, 0, 54)
        r.BackgroundColor3 = THEME.Item
        r.BorderSizePixel = 0
        r.Parent = tab.Page
        corner(6).Parent = r

        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(1, -90, 0, 22)
        l.Position = UDim2.fromOffset(10, 3)
        l.BackgroundTransparency = 1
        l.Text = text
        l.TextColor3 = THEME.Text
        l.Font = Enum.Font.Gotham
        l.TextSize = 13
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.Parent = r

        local val = Instance.new("TextLabel")
        val.Size = UDim2.fromOffset(70, 22)
        val.Position = UDim2.new(1, -80, 0, 3)
        val.BackgroundTransparency = 1
        val.Text = tostring(value)
        val.TextColor3 = THEME.SubText
        val.Font = Enum.Font.Gotham
        val.TextSize = 12
        val.TextXAlignment = Enum.TextXAlignment.Right
        val.Parent = r

        local bar = Instance.new("Frame")
        bar.Size = UDim2.new(1, -20, 0, 6)
        bar.Position = UDim2.fromOffset(10, 36)
        bar.BackgroundColor3 = THEME.Panel
        bar.BorderSizePixel = 0
        bar.Parent = r
        corner(3).Parent = bar

        local fill = Instance.new("Frame")
        fill.Size = UDim2.fromScale((value-minV)/math.max(maxV-minV, 0.0001), 1)
        fill.BackgroundColor3 = THEME.Accent
        fill.BorderSizePixel = 0
        fill.Parent = bar
        corner(3).Parent = fill

        local obj = {}
        function obj:set(v)
            v = math.clamp(math.floor((tonumber(v) or minV)/stepV + 0.5)*stepV, minV, maxV)
            value = v
            val.Text = tostring(v)
            fill.Size = UDim2.fromScale((v-minV)/math.max(maxV-minV, 0.0001), 1)
            if callback then task.spawn(callback, v) end
        end
        function obj:Set(v) obj:set(v) end
        function obj:get() return value end
        function obj:Get() return value end

        local dragging = false
        local function update(x)
            local a = math.clamp((x-bar.AbsolutePosition.X)/math.max(bar.AbsoluteSize.X,1),0,1)
            obj:set(minV+(maxV-minV)*a)
        end
        bar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                update(input.Position.X)
            end
        end)
        UIS.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
        UIS.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
                or input.UserInputType == Enum.UserInputType.Touch) then
                update(input.Position.X)
            end
        end)
        return obj
    end

    function Library:AddLegacyTab(name)
        local tab = self:AddTab(name)

        function tab:section(options)
            return self:AddLabel((options and options.name) or "")
        end

        function tab:label(options)
            return self:AddLabel((options and options.name) or "")
        end

        function tab:toggle(options)
            options = options or {}
            local obj = self:AddToggle(
                options.name or options.Name or "Toggle",
                options.default and true or false,
                options.callback
            )
            function obj:set(v)
                local state = v and true or false
                obj:Set(state)
            end
            function obj:get()
                return obj:Get()
            end
            return obj
        end

        function tab:slider(options)
            options = options or {}
            return Library:AddSlider(
                tab,
                options.name or options.Name or "Slider",
                options.min or 0,
                options.max or 100,
                options.default or options.min or 0,
                options.callback,
                options.interval or options.step or 1
            )
        end

        function tab:dropdown(options)
            options = options or {}
            local list = options.options or options.values or {}
            return self:AddDropdown(
                options.name or options.Name or "Dropdown",
                list,
                options.default,
                options.callback
            )
        end

        return tab
    end

    function Library:window(properties)
        properties = properties or {}
        local win = self
        win.__legacyWindow = true

        function win:toggle_watermark(_)
            return
        end

        function win:tab(options)
            options = options or {}
            return win:AddLegacyTab(options.name or options.Name or "Tab")
        end

        return win
    end

    function Library:notification(options)
        return
    end

    Library.create = function(self, instance, properties, parent)
        local ins = Instance.new(instance)
        for prop, value in pairs(properties or {}) do
            ins[prop] = value
        end
        if parent then ins.Parent = parent end
        return ins
    end

    local library = Library.new("DaDa", Enum.KeyCode.RightShift)

    local window = library:window({
        Name = "DaDa",
        Size = UDim2.fromOffset(620, 500),
    })
    pcall(function() window.toggle_watermark(false) end)

    local pages = {}
    pages[1] = window:tab({name="Combat"})
    pages[2] = window:tab({name="Visual"})
    pages[3] = window:tab({name="Effects"})
    pages[4] = window:tab({name="Movement"})
    pages[5] = window:tab({name="Skins"})
    pages[6] = window:tab({name="Camera"})
    pages[7] = window:tab({name="Config"})

    -- Skin Changer UI: image cards are populated from the configurable asset list below.
    -- Put Roblox asset IDs in `skinCards` to show the corresponding thumbnails.
    local skinCards = {
        {name="Skin 1", id=0},
        {name="Skin 2", id=0},
        {name="Skin 3", id=0},
        {name="Skin 4", id=0},
        {name="Skin 5", id=0},
        {name="Skin 6", id=0},
    }

    local skinSelected = nil
    local skinStatus = nil

    local function skinThumb(assetId)
        assetId = tonumber(assetId) or 0
        if assetId <= 0 then
            return "rbxasset://textures/ui/GuiImagePlaceholder.png"
        end
        return "rbxthumb://type=Asset&id=" .. tostring(assetId) .. "&w=420&h=420"
    end

    local function makeSkinCard(parent, data)
        local card = library:create("Frame", {
            Parent=parent,
            BackgroundColor3=Color3.fromRGB(25,27,33),
            BorderSizePixel=0,
            Size=UDim2.fromOffset(170,190),
        })
        library:create("UICorner",{CornerRadius=UDim.new(0,10)},card)
        library:create("UIStroke",{Color=Color3.fromRGB(44,48,58),Thickness=1},card)

        local image = library:create("ImageLabel", {
            Parent=card,
            BackgroundColor3=Color3.fromRGB(18,20,24),
            BorderSizePixel=0,
            Image=skinThumb(data.id),
            ScaleType=Enum.ScaleType.Fit,
            Position=UDim2.fromOffset(8,8),
            Size=UDim2.new(1,-16,1,-55),
        })
        library:create("UICorner",{CornerRadius=UDim.new(0,8)},image)

        local name = library:create("TextLabel", {
            Parent=card,
            BackgroundTransparency=1,
            Text=tostring(data.name or "Skin"),
            TextColor3=Color3.fromRGB(238,241,247),
            Font=Enum.Font.GothamBold,
            TextSize=12,
            TextXAlignment=Enum.TextXAlignment.Left,
            Position=UDim2.fromOffset(10,148),
            Size=UDim2.new(1,-88,0,18),
        })

        local select = library:create("TextButton", {
            Parent=card,
            BackgroundColor3=Color3.fromRGB(94,159,232),
            BorderSizePixel=0,
            AutoButtonColor=false,
            Text="Выбрать",
            TextColor3=Color3.fromRGB(255,255,255),
            Font=Enum.Font.GothamBold,
            TextSize=11,
            Position=UDim2.new(1,-72,1,-34),
            Size=UDim2.fromOffset(62,26),
        })
        library:create("UICorner",{CornerRadius=UDim.new(0,7)},select)

        select.Activated:Connect(function()
            skinSelected = data
            if skinStatus then
                skinStatus.Text = "Выбран: "..tostring(data.name or "Skin")
            end
        end)

        return card
    end

    do
        local title = pages[5]:label({
            name="SKIN CHANGER",
        })
        local info = pages[5]:label({
            name="Выбирай скин по картинке. ID можно заменить в skinCards.",
        })

        skinStatus = library:create("TextLabel", {
            Parent=library.gui,
            BackgroundTransparency=1,
            Text="Скин не выбран",
            TextColor3=Color3.fromRGB(139,146,160),
            Font=Enum.Font.GothamMedium,
            TextSize=11,
            TextXAlignment=Enum.TextXAlignment.Left,
            Visible=false,
            Size=UDim2.fromOffset(260,22),
        })

        local grid = library:create("ScrollingFrame", {
            Parent=library.gui,
            BackgroundTransparency=1,
            BorderSizePixel=0,
            ScrollBarThickness=4,
            CanvasSize=UDim2.fromOffset(0,0),
            AutomaticCanvasSize=Enum.AutomaticSize.Y,
            Size=UDim2.fromOffset(390,390),
            Visible=false,
        })
        local layout = library:create("UIGridLayout", {
            Parent=grid,
            CellSize=UDim2.fromOffset(170,190),
            CellPadding=UDim2.fromOffset(10,10),
            SortOrder=Enum.SortOrder.LayoutOrder,
        })

        for _, data in ipairs(skinCards) do
            makeSkinCard(grid, data)
        end

        -- Keep the card area aligned with the library's content region.
        runtime.connect(services.run.RenderStepped,function()
            pcall(function()
                local mf = library.main_frame[1]
                if mf and mf.Visible then
                    grid.Position = UDim2.fromOffset(188,58)
                    grid.Visible = (pages[5] and true or false)
                    skinStatus.Position = UDim2.fromOffset(188,448)
                    skinStatus.Visible = (skinSelected ~= nil)
                else
                    grid.Visible = false
                    skinStatus.Visible = false
                end
            end)
        end)
    end

    ------------------------------------------------------------------
    -- control registry (used by the config system)
    ------------------------------------------------------------------
    local cfgRegistry, cfgOrder = {}, {}
    local pageNameOf = setmetatable({}, {__mode="k"})
    do
        local names = {"Combat","Visual","Effects","Movement","Skins","Camera","Config"}
        for i,p in ipairs(pages) do pageNameOf[p] = names[i] end
    end
    local function cfgRegister(page, name, kind, get, set, obj, toLabel)
        local base = (pageNameOf[page] or "?").."/"..name
        local key, n = base, 1
        while cfgRegistry[key] do n = n + 1; key = base.."#"..n end
        cfgRegistry[key] = {kind=kind, get=get, set=set, obj=obj, toLabel=toLabel}
        cfgOrder[#cfgOrder+1] = key
    end

    local function header(page, name)
        page:section({name=name, side="left"})
    end

    local function toggle(page, name, hint, get, set)
        local obj
        local default = get() and true or false
        obj = page:toggle({
            name=name,
            flag="dada_"..string.gsub(name,"%W","_").."_"..tostring(math.random(10000,99999)),
            default=default,
            callback=function(v)
                local ok, result = pcall(set, v)
                if ok and result == false and obj then
                    pcall(obj.set, not v)
                    return
                end
                if statusRefresh then pcall(statusRefresh) end
            end,
        })
        cfgRegister(page, name, "toggle", get, set, obj)
        return obj
    end

    local function slider(page, name, minV, maxV, step, get, set, suffix)
        local obj = page:slider({
            name=name,
            min=minV,
            max=maxV,
            interval=step,
            default=tonumber(get()) or minV,
            suffix=suffix or "",
            flag="dada_"..string.gsub(name,"%W","_").."_"..tostring(math.random(10000,99999)),
            callback=function(v)
                pcall(set,v)
                if statusRefresh then pcall(statusRefresh) end
            end,
        })
        cfgRegister(page, name, "slider", get, set, obj)
        return obj
    end

    local function choice(page, name, hint, options, get, set)
        local values, labels = {}, {}
        local current = get()
        for i,opt in ipairs(options) do
            local value,labelText = opt[1],opt[2]
            values[i], labels[i] = value,labelText
        end
        local defaultLabel
        for i,v in ipairs(values) do
            if v == current then defaultLabel=labels[i] break end
        end
        defaultLabel = defaultLabel or labels[1]
        local obj = page:dropdown({
            name=name,
            items=labels,
            default=defaultLabel,
            flag="dada_"..string.gsub(name,"%W","_").."_"..tostring(math.random(10000,99999)),
            callback=function(labelText)
                for i,labelValue in ipairs(labels) do
                    if labelValue == labelText then
                        pcall(set,values[i])
                        if statusRefresh then pcall(statusRefresh) end
                        break
                    end
                end
            end,
        })
        cfgRegister(page, name, "choice", get, set, obj, function(v)
            for i,val in ipairs(values) do
                if val == v then return labels[i] end
            end
            return nil
        end)
        return obj
    end

    local launcher = library:create("TextButton", {
        Parent = library.gui,
        Name = "DaDa_Hotbar",
        Text = "DaDa  •  " .. tostring(services.players.LocalPlayer and services.players.LocalPlayer.Name or "Player") .. "  •  FPS: --  •  Ping: --ms",
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextColor3 = Color3.fromRGB(238,241,247),
        BackgroundColor3 = Color3.fromRGB(22,24,30),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Size = UDim2.fromOffset(360,34),
        ZIndex = 100,
    })
    library:create("UICorner",{CornerRadius=UDim.new(0,9)},launcher)
    library:create("UIStroke",{Color=Color3.fromRGB(60,65,78),Thickness=1},launcher)

    local launcherBar = library:create("Frame",{
        Parent=launcher,BorderSizePixel=0,BackgroundColor3=C.accent,
        Position=UDim2.new(0,0,1,-2),Size=UDim2.new(0.5,0,0,2),ZIndex=101,
    })
    local launcherBar2 = library:create("Frame",{
        Parent=launcher,BorderSizePixel=0,BackgroundColor3=C.accent2,
        Position=UDim2.new(0.5,0,1,-2),Size=UDim2.new(0.5,0,0,2),ZIndex=101,
    })

    local mainFrame = library.main_frame[1]
    local menuOpen = true
    mainFrame.Visible = true

    local launcherFPS = 0
    local launcherFrames = 0
    local launcherFpsTimer = 0
    local launcherPing = 0
    local launcherLastUpdate = 0

    local function updateLauncherStats(dt)
        dt = tonumber(dt) or (1/60)
        launcherFrames = launcherFrames + 1
        launcherFpsTimer = launcherFpsTimer + dt
        if launcherFpsTimer >= 0.5 then
            launcherFPS = math.floor((launcherFrames / launcherFpsTimer) + 0.5)
            launcherFrames = 0
            launcherFpsTimer = 0
        end

        local ping = nil
        pcall(function()
            local stats = game:GetService("Stats")
            local network = stats:FindFirstChild("Network")
            local serverStats = network and network:FindFirstChild("ServerStatsItem")
            local item = serverStats and (serverStats:FindFirstChild("Data Ping") or serverStats:FindFirstChild("Ping"))
            if item then
                ping = item:GetValue()
            end
        end)
        if type(ping) == "number" and ping >= 0 then
            launcherPing = math.floor(ping + 0.5)
        end

        if launcher and launcher.Parent and (os.clock() - launcherLastUpdate >= 0.25) then
            launcherLastUpdate = os.clock()
            local lp = services.players.LocalPlayer
            local nick = lp and lp.Name or "Player"
            launcher.Text = string.format("DaDa  •  %s  •  FPS: %d  •  Ping: %dms", nick, launcherFPS, launcherPing)
        end
    end

    local function setOpen(v)
        menuOpen = v and true or false
        mainFrame.Visible = menuOpen
        launcher.BackgroundColor3 = menuOpen and Color3.fromRGB(28,31,39) or Color3.fromRGB(20,22,27)
    end

    runtime.connect(launcher.Activated,function()
        setOpen(not menuOpen)
    end)

    runtime.connect(services.input.InputBegan,function(input,processed)
        if not processed and input.KeyCode == Enum.KeyCode.Insert then
            setOpen(not menuOpen)
        end
        if not processed and vis.tpKey and input.KeyCode == Enum.KeyCode.V then
            vis.tp=not vis.tp
            if statusRefresh then pcall(statusRefresh) end
        end
    end)

    runtime.connect(services.run.RenderStepped,function(dt)
        pcall(function()
            updateLauncherStats(dt)
            local cam=services.workspace.CurrentCamera
            if cam and mainFrame and mainFrame.Parent then
                local pos=mainFrame.AbsolutePosition
                local size=mainFrame.AbsoluteSize
                launcher.Position=UDim2.fromOffset(
                    math.clamp(pos.X + size.X/2 - 180, 4, cam.ViewportSize.X-364),
                    math.clamp(pos.Y + size.Y + 8, 4, cam.ViewportSize.Y-42)
                )
            end
        end)
    end)

    ------------------------------------------------------------------
    -- COMBAT
    ------------------------------------------------------------------
    local P1 = pages[1]
    header(P1,"Silent Aim")
    toggle(P1,"Silent Aim","Наводит выстрел на выбранную цель без поворота камеры",function() return aim.on end,function(v) aim.on=v syncAuto() end)
    toggle(P1,"Auto Shoot","Автоматически выполняет выстрел, когда цель подходит",function() return want.auto end,function(v) want.auto=v syncAuto() end)
    toggle(P1,"Auto Scope","Автоматически включает прицеливание перед выстрелом",function() return aim.auto_scope end,function(v) aim.auto_scope=v end)
    toggle(P1,"Auto Wall","Позволяет выбирать цель, даже если между вами есть препятствие",function() return aim.auto_wall end,function(v) aim.auto_wall=v end)
    toggle(P1,"Multipoint","Проверяет дополнительные точки тела при выборе цели",function() return aim.multipoint end,function(v) aim.multipoint=v end)
    toggle(P1,"Magic","Включает альтернативный режим обработки попаданий",function() return aim.magic end,function(v) aim.magic=v end)
    toggle(P1,"Team Check","Исключает игроков из вашей команды из выбора цели",function() return aim.team_check end,function(v) aim.team_check=v end)
    header(P1,"FOV")
    slider(P1,"FOV Silent Aim",1,180,1,function() return aim.fov end,function(v) aim.fov=v end,"°")
    toggle(P1,"Круг FOV","Показывает область вокруг прицела, в которой выбирается цель",function() return aim.draw_fov end,function(v) aim.draw_fov=v end)
    toggle(P1,"Заливка круга","Заполняет область FOV полупрозрачным цветом",function() return aim.fov_fill end,function(v) aim.fov_fill=v end)
    choice(P1,"Цвет круга","", (function()
        local t={} for i,c in ipairs(ringColors) do t[i]={i,c[1]} end return t
    end)(),function() return ringIndex end,function(v)
        ringIndex=v
        local col=ringColors[v] and ringColors[v][2] or accent
        ring.BackgroundColor3=col
        ringStroke.Color=col
    end)
    header(P1,"Хитбоксы")
    choice(P1,"Приоритет","",{{"head","Голова"},{"chest","Грудь"},{"stomach","Живот"},{"arms","Руки"},{"legs","Ноги"}},function() return aim.prefer end,function(v) aim.prefer=v end)
    for _,hb in ipairs({{"head","Голова"},{"chest","Грудь"},{"stomach","Живот"},{"arms","Руки"},{"legs","Ноги"}}) do
        toggle(P1,"Хитбокс: "..hb[2],"Добавляет эту часть тела в список возможных точек попадания",function() return aim.boxes[hb[1]] end,function(v)
            if not v and boxCount()<=1 then return false end
            aim.boxes[hb[1]]=v
        end)
    end
    header(P1,"Урон")
    slider(P1,"Мин. урон",0,100,1,function() return aim.min_damage end,function(v) aim.min_damage=v end)
    slider(P1,"Мин. шанс",0,100,1,function() return aim.min_hitchance end,function(v) aim.min_hitchance=v end,"%")

    header(P1,"Оружие")
    toggle(P1,"Rapid Fire","Уменьшает задержку между выстрелами, если это поддерживается оружием",function() return aim.rapid end,profileToggle("rapid"))
    toggle(P1,"Double Tap","Пытается выполнить два выстрела за один цикл атаки",function() return aim.double_tap end,profileToggle("double_tap"))
    toggle(P1,"Auto Revolver","Автоматически нажимает атаку для револьвера",function() return aim.auto_revolver end,function(v) aim.auto_revolver=v end)
    toggle(P1,"Auto Switch","Автоматически переключает подходящее оружие",function() return aim.auto_switch end,function(v) aim.auto_switch=v end)
    toggle(P1,"No Recoil","Убирает визуальное и/или игровое влияние отдачи, если оно доступно",function() return aim.no_recoil end,function(v) aim.no_recoil=v end)
    toggle(P1,"No Spread","Уменьшает или отключает разброс выстрела, если это поддерживается",function() return aim.no_spread end,function(v) aim.no_spread=v end)
    toggle(P1,"Instant Reload","Убирает или сокращает задержку перезарядки, если это поддерживается",function() return aim.insta_reload end,function(v) aim.insta_reload=v end)

    ------------------------------------------------------------------
    -- VISUAL
    ------------------------------------------------------------------
    local P2 = pages[2]
    header(P2,"ESP")
    toggle(P2,"ESP","Включает отображение информации об игроках",function() return want.esp end,function(v)
        if v and not espAvailable then
            return false
        end
        want.esp=v
        enemy.en=v
        if v and not esp._loaded then esp.Load() end
    end)
    toggle(P2,"Рамки","Рисует рамку вокруг игроков",function() return enemy.box end,function(v) enemy.box=v end)
    toggle(P2,"Имена","Показывает имена игроков над персонажами",function() return enemy.name end,function(v) enemy.name=v end)
    toggle(P2,"Здоровье","Показывает примерное здоровье игрока",function() return enemy.hb end,function(v) enemy.hb=v end)
    toggle(P2,"Союзники","Также отображает игроков вашей команды",function() return friendly.en end,function(v)
        friendly.en=v
        if v and want.esp and not esp._loaded then esp.Load() end
    end)
    toggle(P2,"Учёт команд","Разделяет игроков по командам с помощью цветов",function() return esp.shSet.useTeam end,function(v) esp.shSet.useTeam=v end)
    toggle(P2,"Лимит дистанции","Не показывает игроков дальше заданной дистанции",function() return esp.shSet.limDis end,function(v) esp.shSet.limDis=v end)
    slider(P2,"Макс. дистанция",50,1000,10,function() return esp.shSet.maxDis end,function(v) esp.shSet.maxDis=v end)

    header(P2,"Chams")
    toggle(P2,"Chams","Подсвечивает персонажей для более заметного отображения",function() return vis.chams end,function(v) vis.chams=v end)
    toggle(P2,"Сквозь стены","Сохраняет подсветку видимой через препятствия",function() return vis.chamsWall end,function(v) vis.chamsWall=v end)
    choice(P2,"Цвет заливки","",paletteOptions,function() return vis.chamsColor end,function(v) vis.chamsColor=v end)
    choice(P2,"Цвет контура","",paletteOptions,function() return vis.chamsOutCol end,function(v) vis.chamsOutCol=v end)
    slider(P2,"Прозрачность заливки",0,1,0.05,function() return vis.chamsFill end,function(v) vis.chamsFill=v end)
    slider(P2,"Прозрачность контура",0,1,0.05,function() return vis.chamsOutline end,function(v) vis.chamsOutline=v end)

    header(P2,"Линии / радар")
    toggle(P2,"Snaplines","Рисует линию от экрана к игроку",function() return vis.snap end,function(v)
        if v and not espAvailable then return false end
        vis.snap=v
    end)
    toggle(P2,"Skeleton","Показывает основные соединения тела игрока",function() return vis.skel end,function(v)
        if v and not espAvailable then return false end
        vis.skel=v
    end)
    toggle(P2,"Радар","Показывает ближайших игроков на мини-карте",function() return vis.radar end,function(v) vis.radar=v end)
    toggle(P2,"Список игроков","Показывает список ближайших игроков и их здоровье",function() return vis.plist end,function(v) vis.plist=v end)
    slider(P2,"Дальность радара",50,600,10,function() return vis.radarRange end,function(v) vis.radarRange=v end,"м")
    slider(P2,"Размер радара",100,240,5,function() return vis.radarSize end,function(v) vis.radarSize=v end)

    ------------------------------------------------------------------
    -- MISC
    ------------------------------------------------------------------
    local P3 = pages[3]
    header(P3,"Эффекты")
    toggle(P3,"Bullet Tracer","Показывает трассу от оружия до точки попадания",function() return vis.tracer end,function(v) vis.tracer=v end)
    toggle(P3,"Обычные выстрелы","Показывает трассеры для обычных выстрелов тоже",function() return vis.tracerAll end,function(v) vis.tracerAll=v end)
    choice(P3,"Цвет трассера","",paletteOptions,function() return vis.tracerColor end,function(v) vis.tracerColor=v end)
    slider(P3,"Время жизни",0.2,5,0.1,function() return vis.tracerTime end,function(v) vis.tracerTime=v end," с")
    slider(P3,"Толщина",0.05,0.6,0.05,function() return vis.tracerWidth end,function(v) vis.tracerWidth=v end)

    toggle(P3,"Hit Marker","Показывает отметку в центре при успешном попадании",function() return vis.hitmarker end,function(v) vis.hitmarker=v end)
    toggle(P3,"Hit Impact","Показывает визуальный эффект в месте попадания",function() return vis.impact end,function(v) vis.impact=v end)
    toggle(P3,"Damage Numbers","Показывает нанесённый урон рядом с целью",function() return vis.dmgnum end,function(v) vis.dmgnum=v end)

    header(P3,"Прицел / мир")
    toggle(P3,"Свой прицел","Заменяет стандартный прицел на настраиваемый",function() return vis.crosshair end,function(v) vis.crosshair=v end)
    toggle(P3,"Точка в центре","Добавляет небольшую точку в центр прицела",function() return vis.chDot end,function(v) vis.chDot=v layoutCross() end)
    choice(P3,"Цвет прицела","",paletteOptions,function() return vis.chColor end,function(v)
        vis.chColor=v
        local col=pickColor(v)
        for _,b in ipairs(chBars) do b.BackgroundColor3=col end
        chDot.BackgroundColor3=col
    end)
    slider(P3,"Длина линий",2,30,1,function() return vis.chSize end,function(v) vis.chSize=v layoutCross() end)
    slider(P3,"Зазор",0,20,1,function() return vis.chGap end,function(v) vis.chGap=v layoutCross() end)
    slider(P3,"Толщина линий",1,6,1,function() return vis.chThick end,function(v) vis.chThick=v layoutCross() end)
    toggle(P3,"Fullbright","Увеличивает освещённость мира и убирает затемнение",function() return vis.bright end,function(v)
        vis.bright=v
        if not v then restoreBright() end
    end)
    toggle(P3,"No Fog","Убирает туман и делает дальние объекты видимее",function() return vis.nofog end,function(v)
        vis.nofog=v
        if not v then restoreFog() end
    end)
    toggle(P3,"FOV камеры","Задаёт собственное поле зрения камеры",function() return vis.camfov end,function(v) vis.camfov=v end)
    slider(P3,"Значение FOV камеры",40,120,1,function() return vis.camfovVal end,function(v) vis.camfovVal=v end,"°")
    toggle(P3,"FPS / Ping","Показывает текущий FPS и задержку соединения",function() return vis.info end,function(v)
        vis.info=v
        info.Visible=v
    end)

    header(P3,"Звук")
    toggle(P3,"Hit Sound","Звук при попадании",function() return vis.hitsound end,function(v) vis.hitsound=v end)
    choice(P3,"Звук попадания","",soundOptions,function() return vis.hitSound end,function(v) vis.hitSound=v playSound(v,vis.hitVol,vis.hitPitch) end)
    slider(P3,"Громкость",0.1,5,0.1,function() return vis.hitVol end,function(v) vis.hitVol=v end)
    slider(P3,"Тон",0.5,2,0.05,function() return vis.hitPitch end,function(v) vis.hitPitch=v end)
    toggle(P3,"Kill Effect","Эффект и надпись KILL",function() return vis.killfx end,function(v) vis.killfx=v end)
    choice(P3,"Стиль эффекта","",{{1,"Взрыв"},{2,"Кольцо"}},function() return vis.killStyle end,function(v) vis.killStyle=v end)
    choice(P3,"Цвет эффекта","",paletteOptions,function() return vis.killColor end,function(v) vis.killColor=v end)
    toggle(P3,"Kill Sound","Звук при убийстве",function() return vis.killsound end,function(v) vis.killsound=v end)
    choice(P3,"Звук убийства","",soundOptions,function() return vis.killSoundIdx end,function(v) vis.killSoundIdx=v playSound(v,vis.hitVol,1) end)

            ------------------------------------------------------------------
    -- MOVEMENT
    ------------------------------------------------------------------
    local P4 = pages[4]
    local movement = {
        bhop=false, autoStrafe=false, edgeJump=false, jumpBug=false,
        edgeBug=false, slowWalk=false, pixelSurf=false, slowSpeed=8,
    }
    local movementConn
    local lastGrounded=false
    local lastJump=0
    local oldWalkSpeed=nil
    local function getHumanoid()
        local ch=lp.Character
        return ch and ch:FindFirstChildOfClass("Humanoid")
    end
    local function getRoot()
        local ch=lp.Character
        return ch and ch:FindFirstChild("HumanoidRootPart")
    end
    local function movementStep()
        local hum=getHumanoid()
        local root=getRoot()
        if not hum or not root then return end
        local grounded=hum.FloorMaterial ~= Enum.Material.Air
        local now=os.clock()

        if movement.bhop and grounded and hum.MoveDirection.Magnitude>0.05 and now-lastJump>0.08 then
            hum.Jump=true
            lastJump=now
        end

        if movement.autoStrafe and not grounded and hum.MoveDirection.Magnitude>0.05 then
            local md=hum.MoveDirection
            local vel=root.AssemblyLinearVelocity
            local horizontal=Vector3.new(vel.X,0,vel.Z)
            if horizontal.Magnitude<1 then
                root.AssemblyLinearVelocity=Vector3.new(md.X*hum.WalkSpeed,vel.Y,md.Z*hum.WalkSpeed)
            else
                local target=md.Unit*math.max(horizontal.Magnitude,hum.WalkSpeed*0.75)
                root.AssemblyLinearVelocity=Vector3.new(target.X,vel.Y,target.Z)
            end
        end

        if movement.edgeJump and lastGrounded and not grounded and hum.MoveDirection.Magnitude>0.05 then
            hum.Jump=true
        end

        if movement.jumpBug and not grounded and root.AssemblyLinearVelocity.Y<0 and root.AssemblyLinearVelocity.Y>-8 then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end

        if movement.edgeBug and not grounded and math.abs(root.AssemblyLinearVelocity.Y)<5 then
            root.AssemblyLinearVelocity=Vector3.new(root.AssemblyLinearVelocity.X,0,root.AssemblyLinearVelocity.Z)
        end

        if movement.slowWalk then
            if oldWalkSpeed==nil then oldWalkSpeed=hum.WalkSpeed end
            hum.WalkSpeed=movement.slowSpeed
        elseif oldWalkSpeed~=nil then
            hum.WalkSpeed=oldWalkSpeed
            oldWalkSpeed=nil
        end

        if movement.pixelSurf and not grounded and hum.MoveDirection.Magnitude>0.05 then
            local v=root.AssemblyLinearVelocity
            if v.Y<0 and v.Y>-35 then
                root.AssemblyLinearVelocity=Vector3.new(v.X,math.max(v.Y,-2),v.Z)
            end
        end
        lastGrounded=grounded
    end
    movementConn=runtime.connect(services.run.RenderStepped,movementStep)
    runtime.teardown(function()
        if movementConn then pcall(function() movementConn:Disconnect() end) end
        local hum=getHumanoid()
        if hum and oldWalkSpeed then hum.WalkSpeed=oldWalkSpeed end
        oldWalkSpeed=nil
    end)

    header(P4,"Movement")
    toggle(P4,"Bhop","Автоматически прыгает при движении по земле",function() return movement.bhop end,function(v) movement.bhop=v end)
    toggle(P4,"Auto Strafe","Автоматически поддерживает движение в воздухе",function() return movement.autoStrafe end,function(v) movement.autoStrafe=v end)
    toggle(P4,"Edge Jump","Автоматически выполняет прыжок при сходе с края",function() return movement.edgeJump end,function(v) movement.edgeJump=v end)
    toggle(P4,"Jump Bug","Пытается сохранить прыжковое состояние при приземлении",function() return movement.jumpBug end,function(v) movement.jumpBug=v end)
    toggle(P4,"Edge Bug","Пытается уменьшить вертикальную скорость у края",function() return movement.edgeBug end,function(v) movement.edgeBug=v end)
    toggle(P4,"Slow Walk","Ограничивает скорость передвижения",function() return movement.slowWalk end,function(v) movement.slowWalk=v end)
    slider(P4,"Скорость Slow Walk",1,16,0.5,function() return movement.slowSpeed end,function(v) movement.slowSpeed=v end)
    toggle(P4,"Pixel Surf","Пытается удерживать движение по поверхности при падении",function() return movement.pixelSurf end,function(v) movement.pixelSurf=v end)

    ------------------------------------------------------------------
    -- CAMERA
    ------------------------------------------------------------------
    local P6 = pages[6]
    header(P6,"Третье лицо")
    toggle(P6,"Third Person","Камера за спиной персонажа",function() return vis.tp end,function(v) vis.tp=v end)
    toggle(P6,"Клавиша V","Быстро вкл/выкл третье лицо",function() return vis.tpKey end,function(v) vis.tpKey=v end)
    slider(P6,"Дистанция",3,30,0.5,function() return vis.tpDist end,function(v) vis.tpDist=v end)
    slider(P6,"Высота",-3,6,0.5,function() return vis.tpHeight end,function(v) vis.tpHeight=v end)
    slider(P6,"Сдвиг в сторону",-6,6,0.5,function() return vis.tpShoulder end,function(v) vis.tpShoulder=v end)
    toggle(P6,"Без прохода сквозь стены","Камера упирается в препятствия",function() return vis.tpColl end,function(v) vis.tpColl=v end)
    toggle(P6,"Показывать тело","Убирать скрытие своего персонажа",function() return vis.tpBody end,function(v) vis.tpBody=v end)
    header(P6,"Поле зрения")
    toggle(P6,"FOV камеры","Задаёт собственное поле зрения камеры",function() return vis.camfov end,function(v) vis.camfov=v end)
    slider(P6,"Значение FOV камеры",40,120,1,function() return vis.camfovVal end,function(v) vis.camfovVal=v end,"°")

    statusRefresh=function() end

    ------------------------------------------------------------------
    -- CONFIGS: save / load / delete / share by code
    ------------------------------------------------------------------
    do
        local P7 = pages[7]
        local http = game:GetService("HttpService")
        local DIR = "DaDa/configs"
        local AUTO = "DaDa/autoload.txt"
        local hasFS = type(writefile)=="function" and type(readfile)=="function"
            and type(isfile)=="function" and type(listfiles)=="function" and type(makefolder)=="function"
        if hasFS then
            pcall(makefolder, "DaDa")
            pcall(makefolder, DIR)
        end
        local function notify(text)
            pcall(function() library:notification({text=text, time=3}) end)
        end

        -- base64
        local B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
        local B64rev = {}
        for i=1,64 do B64rev[B64:sub(i,i)] = i-1 end
        local function b64enc(data)
            local out = {}
            for i = 1, #data, 3 do
                local a, b, c = data:byte(i, i+2)
                local n = a*65536 + (b or 0)*256 + (c or 0)
                local c1 = math.floor(n/262144) % 64
                local c2 = math.floor(n/4096) % 64
                local c3 = math.floor(n/64) % 64
                local c4 = n % 64
                out[#out+1] = B64:sub(c1+1,c1+1)..B64:sub(c2+1,c2+1)
                    ..(b and B64:sub(c3+1,c3+1) or "=")..(c and B64:sub(c4+1,c4+1) or "=")
            end
            return table.concat(out)
        end
        local function b64dec(s)
            s = (s:gsub("[^%w%+/=]",""))
            local out = {}
            for i = 1, #s, 4 do
                local a, b, c, d = s:sub(i,i), s:sub(i+1,i+1), s:sub(i+2,i+2), s:sub(i+3,i+3)
                local n = (B64rev[a] or 0)*262144 + (B64rev[b] or 0)*4096 + (B64rev[c] or 0)*64 + (B64rev[d] or 0)
                out[#out+1] = string.char(math.floor(n/65536) % 256)
                if c ~= "=" and c ~= "" then out[#out+1] = string.char(math.floor(n/256) % 256) end
                if d ~= "=" and d ~= "" then out[#out+1] = string.char(n % 256) end
            end
            return table.concat(out)
        end

        -- snapshot / apply
        local function snapshot()
            local data = {}
            for _,key in ipairs(cfgOrder) do
                local e = cfgRegistry[key]
                local ok, v = pcall(e.get)
                if ok and v ~= nil then
                    if e.kind == "toggle" then data[key] = v and true or false
                    elseif e.kind == "slider" then data[key] = tonumber(v)
                    else data[key] = v end
                end
            end
            return data
        end
        local function applyEntry(e, v)
            local arg = v
            if e.kind == "choice" then
                arg = e.toLabel and e.toLabel(v)
                if arg == nil then return false end
            elseif e.kind == "toggle" then
                arg = v and true or false
            elseif e.kind == "slider" then
                arg = tonumber(v)
                if not arg then return false end
            end
            if e.obj and type(e.obj.set) == "function" then
                if pcall(e.obj.set, arg) then return true end
            end
            return (pcall(e.set, e.kind == "choice" and v or arg))
        end
        local function applyData(data)
            local n = 0
            -- turn things on first, then values, then turn off (keeps "at least one hitbox" rule happy)
            for _,key in ipairs(cfgOrder) do
                local e, v = cfgRegistry[key], data[key]
                if v == true and e.kind == "toggle" and applyEntry(e, v) then n = n + 1 end
            end
            for _,key in ipairs(cfgOrder) do
                local e, v = cfgRegistry[key], data[key]
                if v ~= nil and e.kind ~= "toggle" and applyEntry(e, v) then n = n + 1 end
            end
            for _,key in ipairs(cfgOrder) do
                local e, v = cfgRegistry[key], data[key]
                if v == false and e.kind == "toggle" and applyEntry(e, v) then n = n + 1 end
            end
            if statusRefresh then pcall(statusRefresh) end
            return n
        end
        local function encodeJson(data) return http:JSONEncode({v=1, d=data}) end
        local function decodeJson(json)
            local ok, t = pcall(function() return http:JSONDecode(json) end)
            if not ok or type(t) ~= "table" or type(t.d) ~= "table" then return nil end
            return t.d
        end
        local function encodeCode(data) return "DADA1:"..b64enc(encodeJson(data)) end
        local function decodeCode(str)
            str = (tostring(str or ""):gsub("%s",""))
            if str:sub(1,6) ~= "DADA1:" then return nil, "Неверный код конфига" end
            local ok, json = pcall(b64dec, str:sub(7))
            if not ok then return nil, "Не удалось прочитать код" end
            local data = decodeJson(json)
            if not data then return nil, "Конфиг повреждён" end
            return data
        end

        local function cleanName(n)
            n = tostring(n or ""):gsub('[\\/:*?"<>|]', "")
            n = n:gsub("^%s+", ""):gsub("%s+$", "")
            return n
        end
        local function listConfigs()
            local names = {}
            if not hasFS then return names end
            local ok, files = pcall(listfiles, DIR)
            if ok and type(files) == "table" then
                for _,p in ipairs(files) do
                    local nm = tostring(p):match("([^/\\]+)%.json$")
                    if nm then names[#names+1] = nm end
                end
            end
            table.sort(names)
            return names
        end

        local nameValue, codeValue, selected = "", "", nil
        local listDrop, codeBox
        local EMPTY = "(нет конфигов)"
        local function refreshList(pick)
            local names = listConfigs()
            listDrop:refresh_options(#names > 0 and names or {EMPTY})
            if not pick or not table.find(names, pick) then pick = names[1] end
            selected = pick
            listDrop.set(pick or EMPTY)
        end
        local function loadFile(name)
            local path = DIR.."/"..name..".json"
            if not isfile(path) then return false, "Файл не найден" end
            local ok, json = pcall(readfile, path)
            if not ok then return false, "Не удалось прочитать файл" end
            local data = decodeJson(json)
            if not data then return false, "Конфиг повреждён" end
            return true, applyData(data)
        end

        ----------------------------------------------------------- UI
        header(P7, "Конфиги")
        P7:textbox({
            placeholder = "Имя нового конфига",
            flag = "dada_cfg_name",
            callback = function(t) nameValue = t end,
        })
        listDrop = P7:dropdown({
            name = "Сохранённые",
            items = {EMPTY},
            default = EMPTY,
            flag = "dada_cfg_list",
            callback = function(label)
                selected = (label and label ~= EMPTY) and label or nil
            end,
        })
        P7:button({name = "Сохранить конфиг", callback = function()
            if not hasFS then notify("Файлы недоступны — используй код конфига") return end
            local n = cleanName(nameValue)
            if n == "" then n = selected or "default" end
            local ok = pcall(writefile, DIR.."/"..n..".json", encodeJson(snapshot()))
            if ok then notify("Конфиг сохранён: "..n) refreshList(n) else notify("Не удалось сохранить конфиг") end
        end})
        P7:button({name = "Загрузить выбранный", callback = function()
            if not hasFS then notify("Файлы недоступны — используй код конфига") return end
            if not selected then notify("Сначала выбери конфиг") return end
            local ok, res = loadFile(selected)
            if ok then notify("Загружено: "..selected.." ("..tostring(res).." настроек)") else notify(tostring(res)) end
        end})
        P7:button({name = "Удалить выбранный", callback = function()
            if not hasFS or not selected then notify("Нечего удалять") return end
            if type(delfile) ~= "function" then notify("delfile не поддерживается") return end
            local path = DIR.."/"..selected..".json"
            if pcall(delfile, path) then notify("Удалён: "..selected) refreshList() else notify("Не удалось удалить") end
        end})
        P7:button({name = "Обновить список", callback = function()
            refreshList(selected)
            notify("Найдено конфигов: "..tostring(#listConfigs()))
        end})
        P7:toggle({
            name = "Автозагрузка выбранного",
            flag = "dada_cfg_autoload",
            default = (hasFS and isfile(AUTO)) and true or false,
            callback = function(v)
                if not hasFS then return end
                if v and selected then
                    pcall(writefile, AUTO, selected)
                elseif not v and type(delfile) == "function" and isfile(AUTO) then
                    pcall(delfile, AUTO)
                end
            end,
        })

        header(P7, "Передача конфига")
        P7:button({name = "Экспорт: получить код", callback = function()
            local code = encodeCode(snapshot())
            codeBox.set(code)
            if type(setclipboard) == "function" then
                pcall(setclipboard, code)
                notify("Код конфига скопирован в буфер")
            else
                notify("Код в поле ниже — скопируй его вручную")
            end
        end})
        codeBox = P7:textbox({
            placeholder = "Код конфига (вставь сюда для импорта)",
            flag = "dada_cfg_code",
            callback = function(t) codeValue = t end,
        })
        P7:button({name = "Импорт: применить код из поля", callback = function()
            local data, err = decodeCode(codeValue)
            if not data then notify(err) return end
            notify("Конфиг применён ("..tostring(applyData(data)).." настроек)")
        end})
        if type(getclipboard) == "function" then
            P7:button({name = "Импорт: взять код из буфера", callback = function()
                local ok, text = pcall(getclipboard)
                local data, err = decodeCode(ok and text or "")
                if not data then notify(err) return end
                notify("Конфиг применён ("..tostring(applyData(data)).." настроек)")
            end})
        end
        P7:button({name = "Выключить все функции", callback = function()
            local data = {}
            for _,key in ipairs(cfgOrder) do
                if cfgRegistry[key].kind == "toggle" then data[key] = false end
            end
            applyData(data)
            notify("Все переключатели выключены")
        end})

        ----------------------------------------------------------- startup
        if hasFS then
            refreshList()
            pcall(function()
                if isfile(AUTO) then
                    local n = cleanName(readfile(AUTO))
                    if n ~= "" then
                        local ok = loadFile(n)
                        if ok then refreshList(n) end
                    end
                end
            end)
        end
    end

    statusRefresh=function() end
    pages[1].open_tab()

    runtime.own(library.gui)
    runtime.connect(services.run.Heartbeat,function()
        local g = library.gui
        if g and not g.Parent then
            pcall(function()
                local pl = services.players.LocalPlayer
                g.Parent = pl and pl:FindFirstChildOfClass("PlayerGui")
            end)
        end
    end)
    if not modulesOk then
        pcall(function() library:notification({text="Модули игры не найдены: aim/оружие отключены", time=8}) end)
    end

    -- Compatibility variables used by the render loop below.
    local panel = mainFrame
    local shadow = mainFrame
    local scale = mainFrame:FindFirstChildOfClass("UIScale") or library:create("UIScale",{Scale=1},mainFrame)
    local fitScale = 1
    local function fit()
        local camera=services.workspace.CurrentCamera
        if camera then
            local v=camera.ViewportSize
            fitScale=math.min(1,(v.X-24)/620,(v.Y-60)/500)
            scale.Scale=fitScale
        end
    end
    fit()
    local warned={}
    local function safely(name, fn)
        local ok,err=pcall(fn)
        if not ok and not warned[name] then
            warned[name]=true
            warn("DaDa / "..name..": "..tostring(err))
            status.Text="Ошибка "..name.." — смотри консоль"
        end
    end
    runtime.connect(services.run.Heartbeat,function()
        safely("weapon",profiles.ensure)
        safely("auto shoot",hooks.auto)
    end)
    runtime.bind(Enum.RenderPriority.Camera.Value+3,function()
        safely("tracking",tracker.step)
    end)
    runtime.bind(Enum.RenderPriority.First.Value,function() pcall(tpUndo) end)
    runtime.bind(Enum.RenderPriority.Camera.Value+10,function() safely("third person",tpApply) end)
    runtime.bind(Enum.RenderPriority.Last.Value+1,function(dt)
        safely("esp",painter.pump)
        safely("fov ring",updateRing)
        safely("effects",function() effectsStep(tonumber(dt) or 1/60) end)
        fit()
        pcall(function()
            if launcher and launcher.Parent and panel and panel.Parent then
                local cam=services.workspace.CurrentCamera
                if cam then
                    local pos=panel.AbsolutePosition
                    local size=panel.AbsoluteSize
                    launcher.Position=UDim2.fromOffset(
                        math.clamp(pos.X+size.X/2-90,4,cam.ViewportSize.X-184),
                        math.clamp(pos.Y+size.Y+8,4,cam.ViewportSize.Y-38)
                    )
                end
            end
        end)
    end)
    runtime.teardown(function()
        want.auto,want.esp=false,false
        aim.on,aim.auto_shoot,enemy.en=false,false,false
        aim.draw_fov=false
        aim.rapid,aim.double_tap=false,false
        aim.no_recoil,aim.no_spread,aim.insta_reload=false,false,false
        aim.on_shot,aim.on_send=nil,nil
        vis.bright,vis.nofog,vis.camfov=false,false,false
        restoreBright(); restoreFog()
        pcall(fxCleanup)
        pcall(function() fxFolder:Destroy() end)
        if getgenv().DaDa then getgenv().DaDa=nil end
    end)
    getgenv().DaDa={Unload=runtime.release}
    runtime.publish(runtime.release)
    services.reclaim()
    return true
end
local success, err=xpcall(startDaDa,debug.traceback)
if not success then
    runtime.release()
    warn("DaDa: "..tostring(err))
    pcall(function()
        local pl = game:GetService("Players").LocalPlayer
        local pg = pl and pl:FindFirstChildOfClass("PlayerGui")
        local sg = Instance.new("ScreenGui")
        sg.Name, sg.ResetOnSpawn, sg.DisplayOrder, sg.IgnoreGuiInset = "DaDaError", false, 9999, true
        local tl = Instance.new("TextLabel")
        tl.Size = UDim2.new(1,-24,0,150)
        tl.Position = UDim2.fromOffset(12,12)
        tl.BackgroundColor3 = Color3.fromRGB(20,20,24)
        tl.BackgroundTransparency = 0.1
        tl.TextColor3 = Color3.fromRGB(255,120,120)
        tl.TextWrapped = true
        tl.TextXAlignment = Enum.TextXAlignment.Left
        tl.TextYAlignment = Enum.TextYAlignment.Top
        tl.Font = Enum.Font.Code
        tl.TextSize = 13
        tl.Text = "DaDa error:\n"..tostring(err)
        tl.Parent = sg
        sg.Parent = pg or game:GetService("CoreGui")
        game:GetService("Debris"):AddItem(sg, 40)
    end)
    return false
end
return true
