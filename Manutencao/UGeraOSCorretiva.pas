unit UGeraOSCorretiva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ComCtrls;

type
  TFGeraOSCorretiva = class(TForm)
    UDNum_OS: TUpDown;
    MENumOS: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    LBNumInicial: TLabel;
    LBNumFinal: TLabel;
    Bevel1: TBevel;
    MEGeraOS: TBitBtn;
    MESair: TBitBtn;
    Label4: TLabel;
    procedure MESairClick(Sender: TObject);
    procedure MEGeraOSClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGeraOSCorretiva: TFGeraOSCorretiva;

implementation

uses UOSManutencao_cl, UOracle_cl;

{$R *.DFM}

procedure TFGeraOSCorretiva.MESairClick(Sender: TObject);
begin
  close;
end;

procedure TFGeraOSCorretiva.MEGeraOSClick(Sender: TObject);
var
  wCont:Integer;
begin
  wCont:=StrToInt(Trim(MENumOS.text));
  try
    if (DMOracle.DBCemapa.InTransaction=false) then
      DMOracle.DBCemapa.StartTransaction;
    with DMOSManutencao do
    begin
      while wCont > 0 do
      begin
        QGeraOS.Insert;
        QGeraOSDT_EMISSAO.Value:=Date;
        QGeraOSCod_Prioridade.Value:='';
        QGeraOSCod_Tipo_Servico.Value:='CO';
        QGeraOS.Post;
        dec(wCont);
      end;
    end;
    LBNumInicial.Caption:=IntToStr((DMOSManutencao.QGeraOSNum_OS_Manutencao.value)-StrToInt(MENumOS.Text)+1);
    LBNumFinal.Caption:=IntToStr(DMOSManutencao.QGeraOSNum_OS_Manutencao.value);
    LBNumInicial.refresh;
    LBNumFinal.refresh;

    if (DMOracle.DBCemapa.InTransaction=true) then
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TFGeraOSCorretiva.FormActivate(Sender: TObject);
begin
  DMOSManutencao.QGeraOS.open;
end;

procedure TFGeraOSCorretiva.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  FGeraOSCorretiva := nil;
  DMOSManutencao.QGeraOS.close;
end;

end.
