unit UConhecimentoAduaneiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, StdCtrls, DBCtrls, ActnList, ImgList, DB, Menus,
  ComCtrls, Mask, Buttons, ExtCtrls, DBDirceu, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFConhecimentoAduaneiro = class(TFTCadSimples)
    DBEdit20: TDBEdit;
    Label22: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    SBPlaca: TSpeedButton;
    SBMotorista: TSpeedButton;
    Label20: TLabel;
    SBPlacaReb: TSpeedButton;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBDirceu2: TDBDirceu;
    DBEdit33: TDBEdit;
    EmitirMICDTA1: TMenuItem;
    Label1: TLabel;
    SbCidOrigem: TSpeedButton;
    DBEdit1: TDBEdit;
    DBDirceu4: TDBDirceu;
    Label2: TLabel;
    SbCidDestino: TSpeedButton;
    DBEdit2: TDBEdit;
    DBDirceu5: TDBDirceu;
    DBEdit18: TDBEdit;
    DBEdit3: TDBEdit;
    GbMotorista: TGroupBox;
    ENome: TEdit;
    Label3: TLabel;
    ECpf: TEdit;
    Label4: TLabel;
    ERg: TEdit;
    Label5: TLabel;
    ECnh: TEdit;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    procedure SBMotoristaClick(Sender: TObject);
    procedure SBPlacaClick(Sender: TObject);
    procedure SBPlacaRebClick(Sender: TObject);
    procedure SbCidOrigemClick(Sender: TObject);
    procedure SbCidDestinoClick(Sender: TObject);
    procedure EmitirMICDTA1Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoAduaneiro: TFConhecimentoAduaneiro;

implementation

uses UCadastroCons, UVeiculoConhecimentoCons, UConhecimento_cl, UCadastro_cl,
  UVeiculoConhecimento_cl, UCidade_cl, UCidadeCons, UBiblioteca,
  UConhecimentoAduaneiroCons, UOracle_cl,
  UConhecimentoAduaneiroMotoristaCons, UUsuario_cl;

{$R *.dfm}

procedure TFConhecimentoAduaneiro.SBMotoristaClick(Sender: TObject);
begin
  inherited;
  if FConhecimentoAduaneiroMotoristaCons = nil then
    FConhecimentoAduaneiroMotoristaCons := TFConhecimentoAduaneiroMotoristaCons.create(application);
  if FConhecimentoAduaneiroMotoristaCons.ShowModal = mrOk then
    DMConhecimento.QConhecimentoAduaneiroCOD_MOTORISTA.Value := DMConhecimento.QConhecimentoAduaneiroMotConsCOD_MOTORISTA.Value;
end;

procedure TFConhecimentoAduaneiro.SBPlacaClick(Sender: TObject);
begin
  inherited;
  if FveiculoConhecimentoCons = nil then
    FveiculoConhecimentoCons := TFveiculoConhecimentoCons.create(application);
  if FveiculoConhecimentoCons.showmodal = mrOk then
    DMConhecimento.QConhecimentoAduaneiroDESC_PLACA.Value := DMVeiculoConhecimento.QVeiculoConsDESC_PLACA.Value;
end;

procedure TFConhecimentoAduaneiro.SBPlacaRebClick(Sender: TObject);
begin
  inherited;
  if FVeiculoConhecimentoCons = nil then
    FVeiculoConhecimentoCons := TFVeiculoConhecimentoCons.create(application);
  if FVeiculoConhecimentoCons.showmodal = mrOk then
    DMConhecimento.QConhecimentoAduaneiroDESC_PLACA_REBOQUE.Value := DMVeiculoConhecimento.QVeiculoConsDESC_PLACA.Value;
end;

procedure TFConhecimentoAduaneiro.SbCidOrigemClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.create(application);
  if FCidadeCons.ShowModal = mrOk then
    DMConhecimento.QConhecimentoAduaneiroCOD_CIDADE_ORIGEM.Value := DMCidade.QCidadeConsCOD_CIDADE.Value;
end;

procedure TFConhecimentoAduaneiro.SbCidDestinoClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.create(application);
  if FCidadeCons.ShowModal = mrOk then
    DMConhecimento.QConhecimentoAduaneiroCOD_CIDADE_DESTINO.Value := DMCidade.QCidadeConsCOD_CIDADE.Value;
end;

procedure TFConhecimentoAduaneiro.EmitirMICDTA1Click(Sender: TObject);
var
  wCont: Integer;
  wUsuario, wExtenso: string;
  wDesconto: Real;
  wRemetente, wDestinatario, wPagador, wProduto, wMotorista, wProprietario, wPorta: string;
  wAno, wMes, wDia: Word;
begin
  inherited;
  with DMConhecimento do
  begin
    QRConhecimentoAduaneiro.close;
    QRConhecimentoAduaneiro.SetVariable('COD_CONHECIMENTO_ADUANEIRO', QConhecimentoAduaneiroCOD_CONHECIMENTO_ADUANEIRO.Value);
    QRConhecimentoAduaneiro.Open;
    //    DmUsuario.Checar_Filial_Usuario(Trim(QRConhecimentoAduaneiroCOD_FILIAL.Text), 'CONHECIMENTO');
    if Imp = nil then
      Imp := TImp.Create;

    wPorta := DMOracle.FastSelect('DESC_LPT_CONHECIMENTO', 'TB_FILIAL',
        'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
    if wPorta = 'LPT3' then
      Imp.AbreImpressora_Lpt3
    else if wPorta = 'LPT2' then
      Imp.AbreImpressora_Lpt2
    else
      Imp.AbreImpressora;

    Imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 72);
//    Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 72);

    wCont := 11;

    Imp.WriteXY(14, wCont, FormatDateTime('dd/MM/yyyy', QRConhecimentoAduaneiroDT_EMISSAO.Value));

    inc(wCont, 3);
    Imp.WriteXY(11, wCont, QRConhecimentoAduaneiroDESC_CIDADE_ESTADO_ORIGEM.Value);

    inc(wCont, 3);
    Imp.WriteXY(11, wCont, QRConhecimentoAduaneiroDESC_CIDADE_ESTADO_DESTINO.Value);

    inc(wCont, 3);
    Imp.WriteXY(0.5, wCont, QRConhecimentoAduaneiroNOME_PROPRIETARIO.Value);

    inc(wCont, 1);
    Imp.WriteXY(0.5, wCont, QRConhecimentoAduaneiroDESC_ENDERECO_PROPRIETARIO.Value);

    inc(wCont);
    Imp.WriteXY(0.5, wCont, QRConhecimentoAduaneiroDESC_FROTA.Value);
    Inc(wCont);
    Imp.WriteXY(0.5, wCont, QRConhecimentoAduaneiroDESC_FROTA_REBOQUE.Value);

    inc(wCont, 3);
    Imp.WriteXY(6.5, wCont, QRConhecimentoAduaneiroDESC_PLACA.Value);

    inc(wCont, 2);
    Imp.WriteXY(0.5, wCont, QRConhecimentoAduaneiroDESC_MARCA.Value);

    inc(wCont, 1);
    Imp.WriteXY(0.5, wCont, QRConhecimentoAduaneiroDESC_CHASSIS.Value);
    Imp.WriteXY(6.5, wCont, QRConhecimentoAduaneiroVAL_MAX_CARGA.Text);

    inc(wCont, 3);
    Imp.WriteXY(0.5, wCont, QRConhecimentoAduaneiroDESC_ANO_MODELO.Value);
    Imp.WriteXY(6.5, wCont, QRConhecimentoAduaneiroDESC_PLACA_REBOQUE.Value);

    inc(wCont, 3);
    //    Imp.WriteXY(11, wCont, QRConhecimentoAduaneiroNOME_REMETENTE.Value);
    Imp.WriteXY(11, wCont, 'EM LASTRE');

    inc(wCont, 3);
    //    Imp.WriteXY(11, wCont, QRConhecimentoAduaneiroNOME.Value);
    Imp.WriteXY(11, wCont, 'EM LASTRE');

    inc(wCont, 3);
    //    Imp.WriteXY(11, wCont, QRConhecimentoAduaneiroNOME_CONSIGNATARIO.Value);
    Imp.WriteXY(11, wCont, 'EM LASTRE');

    inc(wCont, 3);
    Imp.WriteXY(11, wCont, QRConhecimentoAduaneiroNOME_MOTORISTA.Value);

    inc(wCont, 1);
    Imp.WriteXY(11, wCont, 'RG: ' + QRConhecimentoAduaneiroNUM_RG_MOTORISTA.Value);

    inc(wCont, 1);
    Imp.WriteXY(11, wCont, 'CPF: ' + QRConhecimentoAduaneiroNUM_CPF_MOTORISTA.Value);

    inc(wCont, 1);
    Imp.WriteXY(11, wCont, 'CNH: ' + QRConhecimentoAduaneiroDESC_CARTEIRA_MOTORISTA.Value);

    inc(wCont, 4);
    //    Imp.WriteXY(1, wCont, Copy(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QRConhecimentoAduaneiroCOD_PRODUTO.Text), 1, 22));
    //    Imp.WriteXY(11, wCont, Copy(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QRConhecimentoAduaneiroCOD_PRODUTO.Text), 1, 22));
    Imp.WriteXY(7, wCont, 'EM LASTRE');

    inc(wCont, 17);
    Imp.WriteXY(3, wCont, FormatDateTime('dd/MM/yyyy', QRConhecimentoAduaneiroDT_EMISSAO.Value));

    Imp.SaltaPagina;
    Imp.FechaImpressora;
  end;
end;

procedure TFConhecimentoAduaneiro.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FConhecimentoAduaneiroCons = nil then
    FConhecimentoAduaneiroCons := TFConhecimentoAduaneiroCons.Create(Application);
  if FConhecimentoAduaneiroCons.ShowModal = mrOk then
  begin
    with DMConhecimento do
    begin
      QConhecimentoAduaneiro.Close;
      QConhecimentoAduaneiro.SetVariable('PK', QConhecimentoAduaneiroConsCOD_CONHECIMENTO_ADUANEIRO.Value);
      QConhecimentoAduaneiro.Open;
    end;
  end;
end;

procedure TFConhecimentoAduaneiro.FormActivate(Sender: TObject);
begin
  inherited;
  DMConhecimento.QConhecimentoAduaneiro.Open;
end;

procedure TFConhecimentoAduaneiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMConhecimento.QConhecimentoAduaneiro.Close;
end;

procedure TFConhecimentoAduaneiro.SpeedButton1Click(Sender: TObject);
var
  wCodigo: Integer;
  wRes: String;
begin
  inherited;
  if ENome.Text = '' then
  begin
    MessageDlg('Informe o nome do motorista.', mtError, [mbOK], 0);
    ENome.SetFocus;
    Exit;
  end;

  wRes := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_CONHECIMENTO_ADUANEIRO_MOT', 'NOME = ' + QuotedStr(ENome.Text));
  if StrToInt(wRes) > 0 then
  begin
    MessageDlg('Motorista já cadastrado.', mtError, [mbOK], 0);
    ENome.SetFocus;
    Exit;
  end;

  wCodigo := StrToInt(DMOracle.BuscaNome('SELECT SQCONHECIMENTO_ADUANEIRO_MOT.NEXTVAL FROM DUAL', '1 = 1'));
  DMOracle.ExecutaSql('INSERT INTO TB_CONHECIMENTO_ADUANEIRO_MOT(' +
    'COD_MOTORISTA, NOME, DESC_CPF, DESC_RG, DESC_CNH' +
    ') values (' +
    IntToStr(wCodigo) + ', ' +
    QuotedStr(ENome.Text) + ', ' +
    QuotedStr(ECpf.Text) + ', ' +
    QuotedStr(ERg.Text) + ', ' +
    QuotedStr(ECnh.Text) +
    ')'
    );
  DMConhecimento.QConhecimentoAduaneiroCOD_MOTORISTA.Value := wCodigo;

  ENome.Clear;
  ECpf.Clear;
  ERg.Clear;
  ECnh.Clear;
end;

end.
