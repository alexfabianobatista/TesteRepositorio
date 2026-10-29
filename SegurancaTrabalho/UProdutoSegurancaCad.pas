unit UProdutoSegurancaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFProdutoSegurancaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBRadioGroup6: TDBRadioGroup;
    BtFabricante: TSpeedButton;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    RelaodeProdutosdeSegurana1: TMenuItem;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtFabricanteClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeProdutosdeSegurana1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoSegurancaCad: TFProdutoSegurancaCad;

implementation

uses UProdutoSeguranca_cl, UCadastroCons,
  UCadastro_cl, UProdutoSegurancaCons, USegurancaParam, URProdutoSeguranca;

{$R *.DFM}

procedure TFProdutoSegurancaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMProdutoSeguranca.QProdutoSeguranca.open;
end;

procedure TFProdutoSegurancaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMProdutoSeguranca.QProdutoSeguranca.Close;
end;

procedure TFProdutoSegurancaCad.BtFabricanteClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMProdutoSeguranca.QProdutoSegurancaCod_Cadastro.Value:= DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFProdutoSegurancaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DsEdit,DsInsert] then
    begin
      BtFabricante.Enabled:=True;
    end
  else
    begin
      BtFabricante.Enabled:=False;
    end;
end;

procedure TFProdutoSegurancaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.Create(Application);
  if FProdutoSegurancaCons.showModal = mrOk then
  begin
    with DMProdutoSeguranca do
    begin
      QProdutoSeguranca.Close;
      QProdutoSeguranca.SetVariable('PK',QProdutoSegurancaConsCOD_PRODUTO_SEGURANCA.Value);
      QProdutoSeguranca.open;
    end;
  end;
end;

procedure TFProdutoSegurancaCad.RelaodeProdutosdeSegurana1Click(
  Sender: TObject);
begin
  inherited;
  If FSegurancaParam = Nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[2].TabVisible := True;
  If FSegurancaParam.ShowModal = mrOk then
  with DMProdutoSeguranca do
  begin
    QRProdutoSeguranca.Close;

    if Trim(FSegurancaParam.ME3Fabricante.Text) <> '' then
      QRProdutoSeguranca.SetVariable('COD_CADASTRO',StrToInt(Trim(FSegurancaParam.ME3Fabricante.Text)))
    else
      QRProdutoSeguranca.SetVariable('COD_CADASTRO',NULL);
    if (FSegurancaParam.CB3Situacao.Text = '') or (FSegurancaParam.CB3Situacao.Text = 'TODOS') then
      QRProdutoSeguranca.SetVariable('IND_SITUACAO', NULL)
    else
      QRProdutoSeguranca.SetVariable('IND_SITUACAO',FSegurancaParam.CB3Situacao.Text);
    if FSegurancaParam.RG3Retornavel.ItemIndex = 0 then
      QRProdutoSeguranca.SetVariable('IND_RETORNAVEL','SIM')
    else if FSegurancaParam.RG3Retornavel.ItemIndex = 1 then
      QRProdutoSeguranca.SetVariable('IND_RETORNAVEL','NAO')
    else
      QRProdutoSeguranca.SetVariable('IND_RETORNAVEL',NULL);

    QRProdutoSeguranca.Open;

    If FRProdutoSeguranca = Nil then
      FRProdutoSeguranca := TFRProdutoSeguranca.Create(Application);

    If FSegurancaParam.RGPreview.ItemIndex = 0 then
      FRProdutoSeguranca.QRPrimario.Preview
    else
      FRProdutoSeguranca.QRPrimario.print;

    QRProdutoSeguranca.close;
  end;
end;

procedure TFProdutoSegurancaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(9);
end;

end.
