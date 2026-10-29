unit UComissaoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFComissaoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FComissaoCad: TFComissaoCad;

implementation

uses UComissao_cl, UComissaoCons;

{$R *.dfm}

procedure TFComissaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FComissaoCons = nil then
    FComissaoCons := TFComissaoCons.Create(Application);
  if FComissaoCons.ShowModal = MrOk then
  begin
    DMComissao.QComissao.Close;
    DMComissao.QComissao.SetVariable('PK', DMComissao.QComissaoConsCOD_COMISSAO.Value);
    DMComissao.QComissao.Open;
  end;
end;

procedure TFComissaoCad.FormCreate(Sender: TObject);
begin
  inherited;
  DMComissao.QComissao.Close;
  DMComissao.QComissao.Open;
end;

end.
