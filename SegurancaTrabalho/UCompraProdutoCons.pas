unit UCompraProdutoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFCompraProdutoCons = class(TFTConsulta)
    Label2: TLabel;
    MEFornecedor: TMaskEdit;
    RGSituacao: TRadioGroup;
    SBFilial: TSpeedButton;
    SBFuncionario: TSpeedButton;
    EdFilial: TEdit;
    EdFornecedor: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBFornecedorClick(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure MEFornecedorExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCompraProdutoCons: TFCompraProdutoCons;

implementation

uses UProdutoSeguranca_cl, UFilialCons, UFilial_cl, UFFuncionarioCons,
  UFuncionario_cl, UOracle_cl, UCadastroCons, UCadastro_cl,
  UCompraSeguranca_cl;

{$R *.DFM}

procedure TFCompraProdutoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMCompraSeguranca do
  begin
    QCompraEquipCons.Close;

    if Trim(MEDtInicial.Text) = '' then
      Raise Exception.Create('Data Inicio deve ser Informada')
    else
      QCompraEquipCons.SetVariable('DT_INICIAL', StrToDate(Trim(MEDtInicial.Text)));
    if Trim(MEDtFinal.Text) = '' then
      MEDtFinal.Text:=DateToStr(Date);
    QCompraEquipCons.SetVariable('DT_FINAL', StrToDate(Trim(MEDtFinal.Text)));
    if Trim(METexto.Text) <> '' then
      QCompraEquipCons.SetVariable('COD_FILIAL', StrToInt(Trim(METexto.Text)))
    else
      QCompraEquipCons.SetVariable('COD_FILIAL', NULL);
    if Trim(MEFornecedor.Text) <> '' then
      QCompraEquipCons.SetVariable('COD_CADASTRO', StrToInt(Trim(MEFornecedor.Text)))
    else
      QCompraEquipCons.SetVariable('COD_CADASTRO', NULL);
    if RGSituacao.ItemIndex = 1 then
      QCompraEquipCons.SetVariable('IND_SITUACAO', 'DIGITADA')
    else if RGSituacao.ItemIndex = 2 then
      QCompraEquipCons.SetVariable('IND_SITUACAO', 'CONFIRMADA')
    else
      QCompraEquipCons.SetVariable('IND_SITUACAO', NULL);

    QCompraEquipCons.Open;
  end;
end;

procedure TFCompraProdutoCons.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    METexto.Text := IntToStr(DMFilial.QFilialConsCod_Filial.Value);
    METextoExit(Self);
  end;
end;

procedure TFCompraProdutoCons.SBFornecedorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    MEFornecedor.Text := IntToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    MEFornecedorExit(Self);
  end;
end;

procedure TFCompraProdutoCons.METextoExit(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text) <> '' then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                        'COD_FILIAL = '+Trim(METexto.Text))
  else
    EdFilial.Text := 'Todas';
end;

procedure TFCompraProdutoCons.MEFornecedorExit(Sender: TObject);
begin
  inherited;
  if Trim(MEFornecedor.Text) <> '' then
    EdFornecedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                             'COD_CADASTRO = '+Trim(MEFornecedor.Text))
  else
    EdFornecedor.Text := 'Todos';

end;

procedure TFCompraProdutoCons.FormActivate(Sender: TObject);
begin
  inherited;
  MEDtInicial.Text := DateToStr(Date-30);
  MEDtFinal.Text := DateToStr(Date);
  MEDtInicial.SetFocus;
end;

end.
