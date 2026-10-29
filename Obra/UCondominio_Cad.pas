unit UCondominio_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFCondominio_Cad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    FechamentoMensal1: TMenuItem;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FechamentoMensal1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCondominio_Cad: TFCondominio_Cad;

implementation

uses UImobiliaria_cl, UCondominio_Cons, UImobiliaria_Param,
  UrImobiliaria_Financeiro;

{$R *.dfm}

procedure TFCondominio_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FCondominio_Cons = Nil then
    FCondominio_Cons := TFCondominio_Cons.Create(Application);
  If FCondominio_Cons.ShowModal = mrOk then
  With DMImobiliaria do
  Begin
    QCondominio_Cad.Close;
    QCondominio_Cad.SetVariable('PK',QCondominio_ConsCod_Condominio.Value);
    QCondominio_Cad.Open;
  End;

end;

procedure TFCondominio_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMImobiliaria.QCondominio_Cad.Open;
end;

procedure TFCondominio_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMImobiliaria.QCondominio_Cad.Close;
end;

procedure TFCondominio_Cad.FechamentoMensal1Click(Sender: TObject);
begin
  inherited;
  if FImobiliaria_Param = Nil then
    FImobiliaria_Param := TFImobiliaria_Param.Create(Application);
  FImobiliaria_Param.PGRelatorio.Pages[4].TabVisible := True;
  if FImobiliaria_Param.ShowModal = mrOk then
  with DMImobiliaria do
  begin
    QRContrato_Resumos.Close;
    if Trim(FImobiliaria_Param.Fm5Condominio.MeCondominio.Text) = '' then
      QRContrato_Resumos.SetVariable('COD_CONDOMINIO',Null)
    else
      QRContrato_Resumos.SetVariable('COD_CONDOMINIO',StrToInt(Trim(FImobiliaria_Param.Fm5Condominio.MeCondominio.Text)));
    if Trim(FImobiliaria_Param.Fm2Imovel.MEImovel.Text) = '' then
      QRContrato_Resumos.SetVariable('COD_IMOVEL',Null)
    else
      QRContrato_Resumos.SetVariable('COD_IMOVEL',StrToInt(Trim(FImobiliaria_Param.Fm5Imovel.MEImovel.Text)));
    if Trim(FImobiliaria_Param.Fm5Cadastro.MeCadastro.Text) = '' then
      QRContrato_Resumos.SetVariable('COD_PROPRIETARIO',Null)
    else
      QRContrato_Resumos.SetVariable('COD_PROPRIETARIO',StrToInt(Trim(FImobiliaria_Param.Fm5Cadastro.MeCadastro.Text)));
    QRContrato_Resumos.Open;
    if FRImobiliaria_Financeiro = Nil then
      FRImobiliaria_Financeiro := TFRImobiliaria_Financeiro.Create(Application);
    if FImobiliaria_Param.RGPreview.ItemIndex = 0 then
       FRImobiliaria_Financeiro.QRPrimario.Preview
    else
      FRImobiliaria_Financeiro.QRPrimario.Print;
    QRContrato_Resumos.Close;
  end;

end;

end.
