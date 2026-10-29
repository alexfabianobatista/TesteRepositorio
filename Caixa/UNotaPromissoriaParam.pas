unit UNotaPromissoriaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFNotaPromissoriaParam = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    MEvalor: TMaskEdit;
    MEVencimento: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    MECliente: TMaskEdit;
    EDCliente: TEdit;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    MEFilial: TMaskEdit;
    EDFilial: TEdit;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    MECidade: TMaskEdit;
    EDCidade: TEdit;
    SpeedButton3: TSpeedButton;
    edCPFCNPJ: TEdit;
    Label6: TLabel;
    EDEndereco: TEdit;
    Label7: TLabel;
    EDCidadeFilial: TEdit;
    Label8: TLabel;
    MEDtLocal: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    MELocal: TMaskEdit;
    Label11: TLabel;
    MEAvalista: TMaskEdit;
    EdAvalista: TEdit;
    SpeedButton4: TSpeedButton;
    procedure MEClienteExit(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure MECidadeExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MEAvalistaExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaPromissoriaParam: TFNotaPromissoriaParam;
  

implementation

uses UOracle_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UCidadeCons, UCidade_cl, URNotaPromissoriaExtra;

{$R *.DFM}

procedure TFNotaPromissoriaParam.MEClienteExit(Sender: TObject);
begin
  if Trim(MECliente.Text) <> '' then
    EDCliente.Text := DMOracle.BuscaNome('SELECT NOME || '+chr(39)+' CPF/CNPJ: '+chr(39)+' || NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(MECliente.Text));
end;

procedure TFNotaPromissoriaParam.MEFilialExit(Sender: TObject);
begin
  if Trim(MEFilial.Text) <> '' then
  begin
    EDFilial.Text       := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(MEFilial.Text));
    edCPFCNPJ.Text      := DMOracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL','COD_FILIAL = ' + Trim(MEFilial.Text));
    EDEndereco.Text     := DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_FILIAL','COD_FILIAL = ' + Trim(MEFilial.Text));
    EDCidadeFilial.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL','COD_FILIAL = ' + Trim(MEFilial.Text));
    MeLocal.Text := EDCidadeFilial.Text;
  end;
end;

procedure TFNotaPromissoriaParam.MECidadeExit(Sender: TObject);
begin
  if Trim(MECidade.Text) <> '' then
    EDCidade.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE || '+CHR(39)+' - '+CHR(39)+' || COD_ESTADO FROM TB_CIDADE','COD_CIDADE = ' + Trim(MECidade.Text));
end;

procedure TFNotaPromissoriaParam.SpeedButton2Click(Sender: TObject);
begin
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.Showmodal = mrOk then
  begin
    MEFilial.Text := FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    MEFilialExit(sender);
  end;
end;

procedure TFNotaPromissoriaParam.SpeedButton1Click(Sender: TObject);
begin
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.Showmodal = mrOk then
  begin
    MECliente.Text := IntToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    MEClienteExit(sender);
  end;
end;

procedure TFNotaPromissoriaParam.SpeedButton3Click(Sender: TObject);
begin
  if FCidadeCons = Nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.Showmodal = mrOk then
  begin
    MECidade.Text := IntToStr(DMCidade.QCidadeConsCod_cidade.Value);
    MECidadeExit(sender);
  end;
end;

procedure TFNotaPromissoriaParam.BitBtn1Click(Sender: TObject);
begin
  if FRNotaPromissoriaExtra = nil then
    FRNotaPromissoriaExtra := TFRNotaPromissoriaExtra.create(application);

  FRNotaPromissoriaExtra.setDados(StrToFloat(MEvalor.Text), strtodate(MEVencimento.Text),
           EDCliente.Text, EDCidade.Text,EDFilial.Text,edCPFCNPJ.Text,EDEndereco.Text, EDCidadeFilial.Text,
           MELocal.Text,strtodate(MEDtLocal.Text), EdAvalista.Text);

  FRNotaPromissoriaExtra.QRPrimario.Preview;

end;

procedure TFNotaPromissoriaParam.MEAvalistaExit(Sender: TObject);
begin
  if Trim(MEAvalista.Text) <> '' then
    EdAvalista.Text := DMOracle.BuscaNome('SELECT NOME || '+chr(39)+'-'+chr(39)+' || NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(MEAvalista.Text));
end;

procedure TFNotaPromissoriaParam.SpeedButton4Click(Sender: TObject);
begin
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.Showmodal = mrOk then
  begin
    MEAvalista.Text := IntToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    MEAvalistaExit(Sender);
  end;
end;

procedure TFNotaPromissoriaParam.FormActivate(Sender: TObject);
begin
  MeDtLocal.Text := DateToStr(Date);
end;

end.
