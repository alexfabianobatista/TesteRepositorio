unit UNotaEntradaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, Db, variants,
  Menus;

type
  TFNotaEntradaCons = class(TFTConsulta)
    MENumNota: TMaskEdit;
    Label2: TLabel;
    BtConsCadastro: TBitBtn;
    RGSituacao: TRadioGroup;
    MEEntradaI: TMaskEdit;
    Label3: TLabel;
    MEEntradaF: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    MeFilial: TMaskEdit;
    BtFilial: TBitBtn;
    DBGrid2: TDBGrid;
    DSItemNF: TDataSource;
    LblParceria: TLabel;
    MEParceria: TMaskEdit;
    BtParceria: TBitBtn;
    Label6: TLabel;
    meNumCF: TMaskEdit;
    LBVariosRegistros: TLabel;
    Label7: TLabel;
    MEOperacao: TMaskEdit;
    BtOperacaoCons: TBitBtn;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure DSConsultaDataChange(Sender: TObject; Field: TField);
    procedure BtParceriaClick(Sender: TObject);
    procedure BtOperacaoConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaEntradaCons: TFNotaEntradaCons;

implementation

uses UNotaEntrada_cl, UCadastroCons, UCadastro_cl, UFilialCons, UFilial_cl,
  UParamSistema_cl, UOperacao_cl, UOperacaoCons;

{$R *.DFM}

procedure TFNotaEntradaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMNotaEntrada do
  Begin
    QNotaEntradaCons.Close;
    QNotaEntradaCons.SetVariable('DATA_I',StrToDate(MEEntradaI.Text));
    QNotaEntradaCons.SetVariable('DATA_F',StrToDateTime(MEEntradaF.Text + ' 23:59:59'));

    If Trim(METexto.Text) <> '' Then
      QNotaEntradaCons.SetVariable('CADASTRO',METexto.Text)
    Else
      QNotaEntradaCons.SetVariable('CADASTRO',Null);
    If Trim(MeFilial.Text) <> '' Then
      QNotaEntradaCons.SetVariable('COD_FILIAL',MeFilial.Text)
    Else
      QNotaEntradaCons.SetVariable('COD_FILIAL',Null);
    If Trim(MENumNota.Text) <> '' Then
      QNotaEntradaCons.SetVariable('NUM_NOTA',MENumNota.Text)
    Else
      QNotaEntradaCons.SetVariable('NUM_NOTA',Null);
    If Trim(MEParceria.Text) <> '' Then
      QNotaEntradaCons.SetVariable('PARCEIRO',MEParceria.Text)
    Else
      QNotaEntradaCons.SetVariable('PARCEIRO',Null);
    If Trim(MEOperacao.Text) <> '' Then
      QNotaEntradaCons.SetVariable('COD_OPERACAO', Trim(MEOperacao.Text))
    Else
      QNotaEntradaCons.SetVariable('COD_OPERACAO',Null);
    If Trim(meNumCF.Text) <> '' Then
      QNotaEntradaCons.SetVariable('NUMCF',meNumCF.Text)
    Else
      QNotaEntradaCons.SetVariable('NUMCF',Null);

    QNotaEntradaCons.SetVariable('SITUACAO',FloatToStr(RGSituacao.ItemIndex));

    QNotaEntradaCons.Open;
  End;
end;


procedure TFNotaEntradaCons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFNotaEntradaCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEEntradaF.Text := DateToStr(Date);
  MEEntradaI.Text := DateToStr(Date-60);
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
   Begin
     LblParceria.Visible := True;
     MEParceria.Visible := True;
     BtParceria.Visible := True;
   End;
end;

procedure TFNotaEntradaCons.BtFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFNotaEntradaCons.DSConsultaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  DMNotaEntrada.QItemNfCons.close;
  DMNotaEntrada.QItemNfCons.SetVariable('Cod_Nota_Cab',DMNotaEntrada.QNotaEntradaConsCod_Nota_Cab.Value);
  DMNotaEntrada.QItemNfCons.Open;
end;

procedure TFNotaEntradaCons.BtParceriaClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    MEParceria.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFNotaEntradaCons.BtOperacaoConsClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 0;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  if FOperacaoCons.ShowModal = mrOK then
    MEOperacao.Text := DMOperacao.QOperacaoConsCOD_OPERACAO.Text;
end;

procedure TFNotaEntradaCons.FormActivate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'PAULINHO' then
    FNotaEntradaCons.WindowState := wsMaximized;
end;

initialization
  RegisterClass(TFNotaEntradaCons);

end.
