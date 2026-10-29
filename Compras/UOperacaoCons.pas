unit UOperacaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, Db, variants,
  Menus, ComCtrls, ActnList;

type
  TFOperacaoCons = class(TFTConsulta)
    RGTipoOperacao: TRadioGroup;
    MECodigo: TMaskEdit;
    Label2: TLabel;
    RGLiberado: TRadioGroup;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Action1: TAction;
    MEResumo: TMaskEdit;
    Label3: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure proc_consulta_operacao;
    procedure MECodigoChange(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure RGTipoOperacaoClick(Sender: TObject);
    procedure RGLiberadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCons: TFOperacaoCons;

implementation

uses UOperacao_cl, UParamSistema_cl, UImpressoraFiscal;

{$R *.DFM}

procedure TFOperacaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  proc_consulta_operacao();

//  With DMOperacao do
//  Begin
//    QOperacaoCons.Close;
//    if Trim(METexto.Text) <> '' then
//      QOperacaoCons.SetVariable('DESC_OPERACAO', Trim(METexto.Text))
//    else
//      QOperacaoCons.SetVariable('DESC_OPERACAO', null);
//    if Trim(MECodigo.text) = '' then
//      QOperacaoCons.SetVariable('COD_OPERACAO', null)
//    else
//      QOperacaoCons.SetVariable('COD_OPERACAO',StrToInt(Trim(MECodigo.text)));
//    case RGTipoOperacao.ItemIndex of
//    0: QOperacaoCons.SetVariable('TIPO_OPERACAO', 'E');
//    1: QOperacaoCons.SetVariable('TIPO_OPERACAO', 'S');
//    2: QOperacaoCons.SetVariable('TIPO_OPERACAO', null);
//    end;
//    case RGLiberado.ItemIndex of
//    0: QOperacaoCons.SetVariable('IND_LIBERADO', 'S');
//    1: QOperacaoCons.SetVariable('IND_LIBERADO', 'N');
//    2: QOperacaoCons.SetVariable('IND_LIBERADO', null);
//    end;
//
//    QOperacaoCons.Open;
//  End;
end;

procedure TFOperacaoCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DSConsulta.DataSet = nil then
    DSConsulta.DataSet := DMOperacao.QOperacaoCons;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
    
  if pos('NFC',DMParamSistema.CodEmpresa) > 0 then
    RGTipoOperacao.ItemIndex := 1;
end;

procedure TFOperacaoCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFOperacaoCons.proc_consulta_operacao;
begin
  With DMOperacao do
  Begin
    QOperacaoCons.Close;
    if Trim(METexto.Text) <> '' then
      QOperacaoCons.SetVariable('DESC_OPERACAO', Trim(METexto.Text))
    else
      QOperacaoCons.SetVariable('DESC_OPERACAO', null);
    if Trim(MECodigo.text) = '' then
      QOperacaoCons.SetVariable('COD_OPERACAO', null)
    else
      QOperacaoCons.SetVariable('COD_OPERACAO',StrToInt(Trim(MECodigo.text)));
    if Trim(MEResumo.Text) <> '' then
      QOperacaoCons.SetVariable('DESC_RESUMO',Trim(MEResumo.Text))
    else
      QOperacaoCons.SetVariable('DESC_RESUMO',Null);

    case RGTipoOperacao.ItemIndex of
    0: QOperacaoCons.SetVariable('TIPO_OPERACAO', 'E');
    1: QOperacaoCons.SetVariable('TIPO_OPERACAO', 'S');
    2: QOperacaoCons.SetVariable('TIPO_OPERACAO', null);
    end;
    case RGLiberado.ItemIndex of
    0: QOperacaoCons.SetVariable('IND_LIBERADO', 'S');
    1: QOperacaoCons.SetVariable('IND_LIBERADO', 'N');
    2: QOperacaoCons.SetVariable('IND_LIBERADO', null);
    end;

    QOperacaoCons.Open;
  End;
end;

procedure TFOperacaoCons.MECodigoChange(Sender: TObject);
begin
  inherited;
  proc_consulta_operacao();
end;

procedure TFOperacaoCons.METextoChange(Sender: TObject);
begin
  inherited;
  proc_consulta_operacao();
end;

procedure TFOperacaoCons.RGTipoOperacaoClick(Sender: TObject);
begin
  inherited;
  proc_consulta_operacao();
end;

procedure TFOperacaoCons.RGLiberadoClick(Sender: TObject);
begin
  inherited;
  proc_consulta_operacao();
end;

end.
