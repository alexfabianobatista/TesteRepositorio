unit UClienteSCPC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFClienteSCPC = class(TFTCadSimples)
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    SBCliente: TSpeedButton;
    DBDirceu1: TDBDirceu;
    SBContaReceber: TSpeedButton;
    Opes1: TMenuItem;
    BaixaClienteSCPC1: TMenuItem;
    VoltarBaixa1: TMenuItem;
    RelClientesSCPC1: TMenuItem;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    RGComprador: TRadioGroup;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    procedure SBClienteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBContaReceberClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BaixaClienteSCPC1Click(Sender: TObject);
    procedure VoltarBaixa1Click(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure RelClientesSCPC1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure RGCompradorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClienteSCPC: TFClienteSCPC;

implementation

uses UCadastro_cl, UCadastroCons, UContasReceberCons, UContasReceber_cl,
  UOracle_cl, UClienteSCPCCons, UClienteSCPCParam, URClienteSCPC;

{$R *.dfm}

procedure TFClienteSCPC.SBClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
    DBEdit2.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    DBEdit2Exit(Self);
end;

procedure TFClienteSCPC.FormActivate(Sender: TObject);
begin
  inherited;
  DMCadastro.QClienteSCPC.Open;
end;

procedure TFClienteSCPC.SBContaReceberClick(Sender: TObject);
begin
  inherited;
  if FContasReceberCons = Nil then
    FContasReceberCons := TFContasReceberCons.Create(Application);
  if FContasReceberCons.ShowModal = MrOk then
  begin
    DMCADASTRO.QClienteSCPCCOD_CONTA_RECEBER_CAB.Text := DMContasReceber.QContasReceber_CabConsCOD_CONTA_RECEBER_CAB.Text;
    DBEdit3Exit(Self);
  end;
end;

procedure TFClienteSCPC.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if DBEdit3.Text <> '' then
  begin
    DMCADASTRO.QClienteSCPCNUM_VALOR.Text := DMOracle.BuscaNome('SELECT VAL_TITULO FROM TB_CONTA_RECEBER_CAB',
                                                                'COD_CONTA_RECEBER_CAB = ' + DBEdit3.Text, true);
    DMCADASTRO.QClienteSCPCDT_VENCIMENTO.Text := DMOracle.BuscaNome('SELECT DT_VENCIMENTO FROM TB_CONTA_RECEBER_CAB',
                                                                    'COD_CONTA_RECEBER_CAB = ' + DBEdit3.Text, true);
    DMCADASTRO.QClienteSCPCDT_EMISSAO.Text := DMOracle.BuscaNome('SELECT DT_EMISSAO FROM TB_CONTA_RECEBER_CAB',
                                                                 'COD_CONTA_RECEBER_CAB = ' + DBEdit3.Text, true);
    DMCADASTRO.QClienteSCPCDESC_CONTRATO.Text := DMOracle.BuscaNome('SELECT NUM_TITULO FROM TB_CONTA_RECEBER_CAB',
                                                                    'COD_CONTA_RECEBER_CAB = ' + DBEdit3.Text, true);
    if trim(DBEdit2.Text) = '' then
    begin
      DMCadastro.QClienteSCPCCOD_CADASTRO.Text :=
      DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CONTA_RECEBER_CAB','COD_CONTA_RECEBER_CAB = ' + DBEdit3.Text, true);
      DBEdit2Exit(Self);
    end;
  end;
end;

procedure TFClienteSCPC.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FClienteSCPCCons = Nil then
    FClienteSCPCCons := TFClienteSCPCCons.Create(Application);
  if FClienteSCPCCons.ShowModal = MrOk then
  begin
    MELocaliza.Text := DMCadastro.QClienteSCPCConsCOD_CLIENTE_SCPC.Text;
    MELocalizaExit(Self);
  end;
end;

procedure TFClienteSCPC.BaixaClienteSCPC1Click(Sender: TObject);
begin
  inherited;
  with DMCadastro do
  begin
    try
      QClienteSCPC.Open;
      QClienteSCPC.Edit;
      QClienteSCPCDT_RETIRADA_SCPC.Value := Date;
      QClienteSCPC.Post;
      ShowMessage('Operação realizada com sucesso');
    Except
      Raise Exception.Create('Transação não Realizada');
    end;
  end;
  MMCadSimples.Items[2].Items[0].Enabled := false;
  MMCadSimples.Items[2].Items[1].Enabled := true;
end;
procedure TFClienteSCPC.VoltarBaixa1Click(Sender: TObject);
begin
  inherited;
  with DMCadastro do
  begin
    try
      QClienteSCPC.Open;
      QClienteSCPC.Edit;
      QClienteSCPCDT_RETIRADA_SCPC.Text := '';
      QClienteSCPC.Post;
      ShowMessage('Operação realizada com sucesso');
    Except
      Raise Exception.Create('Transação não Realizada');
    end;
  end;
  MMCadSimples.Items[2].Items[0].Enabled := true;
  MMCadSimples.Items[2].Items[1].Enabled := false;
end;

procedure TFClienteSCPC.MELocalizaExit(Sender: TObject);
begin
  inherited;
  if DMCadastro.QClienteSCPCDT_RETIRADA_SCPC.Text <> '' then
  begin
    MMCadSimples.Items[2].Items[0].Enabled := false;
    MMCadSimples.Items[2].Items[1].Enabled := true;
  end
  else
  begin
    MMCadSimples.Items[2].Items[0].Enabled := true;
    MMCadSimples.Items[2].Items[1].Enabled := false;
  end;
end;

procedure TFClienteSCPC.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBCliente.Enabled := DSPrimario.State in [DsEdit, DsInsert];
  SBContaReceber.Enabled := DSPrimario.State in [DsEdit, DsInsert];
  RGComprador.Enabled := DSPrimario.State in [DsEdit, DsInsert];
  if (DSPrimario.State  <> DsEdit) and  (DSPrimario.State  <> DsInsert) then
    RGComprador.ItemIndex := 0;

  if DSPrimario.State in [DsInsert] then
  begin
    DMCadastro.QClienteSCPCDT_REGISTRO.Value := Date;
  end;
end;

procedure TFClienteSCPC.RelClientesSCPC1Click(Sender: TObject);
begin
  inherited;
  if FClienteSCPCParam = Nil then
    FClienteSCPCParam := TFClienteSCPCParam.Create(Application);
  FClienteSCPCParam.PGRelatorio.Pages[0].TabVisible := true;
  if FClienteSCPCParam.ShowModal = MrOk then
  begin
    with DMCadastro do
    begin
      QRClienteSCPC.Close;

      if trim(FClienteSCPCParam.FmCadastro1.MeCadastro.Text) <> '' then
        QRClienteSCPC.SetVariable('CLIENTE', trim(FClienteSCPCParam.FmCadastro1.MeCadastro.Text))
      else
        QRClienteSCPC.SetVariable('CLIENTE', null);

      if trim(FClienteSCPCParam.Me1Data_I.Text) <> '' then
        QRClienteSCPC.SetVariable('DATA_I', trim(FClienteSCPCParam.Me1Data_I.Text))
      else
        Raise Exception.Create('Data inicial deve ser informada');

      if trim(FClienteSCPCParam.Me1Data_F.Text) <> '' then
        QRClienteSCPC.SetVariable('DATA_F', trim(FClienteSCPCParam.Me1Data_F.Text))
      else
        QRClienteSCPC.SetVariable('DATA_F', DateToStr(Date));

      QRClienteSCPC.Open;
    end;

    if FRClienteSCPC = Nil then
      FRClienteSCPC := TFRClienteSCPC.Create(Application);
    FRClienteSCPC.QRLPeriodo.Caption := 'De ' + trim(FClienteSCPCParam.Me1Data_I.Text) + ' até ' +
    trim(FClienteSCPCParam.Me1Data_F.Text);
    if FClienteSCPCParam.RGPreview.ItemIndex = 0 then
      FRClienteSCPC.QRPrimario.Preview
    else
      FRClienteSCPC.QRPrimario.Print;
  end;
end;

procedure TFClienteSCPC.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if trim(DBEdit2.Text) <> '' then
    DMCadastro.QClienteSCPCCOD_CADASTRO.Text := DBEdit2.Text;
end;

procedure TFClienteSCPC.RGCompradorClick(Sender: TObject);
begin
  inherited;
    if RGComprador.ItemIndex = 1 then
    begin
      DBEdit11.Enabled := true;
      DBEdit11.Color := clWindow;
      DBEdit12.Enabled := true;
      DBEdit12.Color := clWindow;
    end
    else
    begin
      DBEdit11.Enabled := false;
      DBEdit11.Color := clBtnFace;
      DBEdit12.Enabled := false;
      DBEdit12.Color := clBtnFace;
    end;
end;

end.
