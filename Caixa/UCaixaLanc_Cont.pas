unit UCaixaLanc_Cont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFCaixa_Lanc_Cont = class(TForm)
    MECodReduzidoCredito: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MEDescContaCredito: TMaskEdit;
    MECodReduzidoDebito: TMaskEdit;
    SpeedButton2: TSpeedButton;
    MEDescContaDebito: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    MEContaCredito: TMaskEdit;
    MEContaDebito: TMaskEdit;
    BitBtn1: TBitBtn;
    LbHistorico: TLabel;
    MeHistorico: TMaskEdit;
    Label3: TLabel;
    MeFilialDebito: TMaskEdit;
    MeFilialCredito: TMaskEdit;
    Label4: TLabel;
    SbConsHistorico: TSpeedButton;
    MeHistoricoDescricao: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MEContaCreditoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MEContaDebitoExit(Sender: TObject);
    procedure MECodReduzidoCreditoExit(Sender: TObject);
    procedure MECodReduzidoDebitoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SbConsHistoricoClick(Sender: TObject);
    procedure MeHistoricoExit(Sender: TObject);
  private
    { Private declarations }
    FFilial : Integer;
  public
    { Public declarations }
    Property pFilial : Integer read FFilial write FFilial;
  end;

var
  FCaixa_Lanc_Cont: TFCaixa_Lanc_Cont;

implementation

uses UParamSistema_cl, UBiblioteca, UPlanoContaCons, UPlanoConta_cl,
  UOracle_cl, UHistContabilCons, UHistContabil_cl;

{$R *.DFM}

procedure TFCaixa_Lanc_Cont.FormActivate(Sender: TObject);
begin
  Case Trunc(DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value) of
    4:begin
      MEContaCredito.EditMask:='#.##.##.######;0;';
      MEContaDebito.EditMask:='#.##.##.######;0;';
      end;
    5:begin
      MEContaCredito.EditMask:='#.##.##.##.######;0;';
      MEContaDebito.EditMask:='#.##.##.##.######;0;';
      end;
    6:begin
      MEContaCredito.EditMask:='#.##.##.##.##.######;0;';
      MEContaDebito.EditMask:='#.##.##.##.##.######;0;';
      end;
  end;
end;

procedure TFCaixa_Lanc_Cont.SpeedButton1Click(Sender: TObject);
begin
  if FPlanoContaCons = Nil then
    FPlanoContaCons :=  TFPlanoContaCons.Create(Application);
  FPlanoContaCons.MECodFilial.text:=FloatToStr(pFilial);
  FPlanoContaCons.MECodFilial.Enabled:=False;
  if FPlanoContaCons.ShowModal = mrOk then
    begin
      MEContaCredito.text:=DMPlanoConta.QPlanoContaConsNum_Plano_conta.Value;
      MEContaCreditoExit(Self);
    end;
  FPlanoContaCons.MECodFilial.Enabled:=True;
end;

procedure TFCaixa_Lanc_Cont.MEContaCreditoExit(Sender: TObject);
begin
  if Trim(Bib.LimpaString(MEContaCredito.text,'.'))<>'' then
    begin
      MEDescContaCredito.text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+ CHR(39)+Bib.LimpaString(MEContaCredito.text,'.')+ CHR(39)+' AND COD_FILIAL = '+FloatToStr(1));
      MECodReduzidoCredito.text:=DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+Bib.LimpaString(MEContaCredito.text,'.')+CHR(39)+' AND COD_FILIAL = '+FloatToStr(1));
    end
  else
    begin
      MEDescContaCredito.Clear;
      MECodReduzidoCredito.Clear;
    end;
end;

procedure TFCaixa_Lanc_Cont.SpeedButton2Click(Sender: TObject);
begin
  If FPlanoContaCons = Nil then
    FPlanoContaCons :=  TFPlanoContaCons.Create(Application);
  FPlanoContaCons.MECodFilial.text:=FloatToStr(pFilial);
  FPlanoContaCons.MECodFilial.Enabled:=False;
  If FPlanoContaCons.ShowModal = mrOk then
   begin
     MEContaDebito.text:=DMPlanoConta.QPlanoContaConsNum_Plano_conta.Value;
     MEContaDebitoExit(Self);
   end;
  FPlanoContaCons.MECodFilial.Enabled:=True;
end;

procedure TFCaixa_Lanc_Cont.MEContaDebitoExit(Sender: TObject);
begin
  if Trim(Bib.LimpaString(MEContaDebito.text,'.'))<>'' then
    begin
      MEDescContaDebito.text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+ CHR(39)+Bib.LimpaString(MEContaDebito.text,'.')+ CHR(39)+' AND COD_FILIAL = '+FloatToStr(1));
      MECodReduzidoDebito.text:=DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+Bib.LimpaString(MEContaDebito.text,'.')+CHR(39)+' AND COD_FILIAL = '+FloatToStr(1));
    end
  else
    begin
      MEDescContaDebito.Clear;
      MECodReduzidoDebito.Clear;
    end;
end;

procedure TFCaixa_Lanc_Cont.MECodReduzidoCreditoExit(Sender: TObject);
begin
  if (Trim(MECodReduzidoCredito.text)<>'') and (Trim(MECodReduzidoCredito.text)<>'0')then
    begin
      MEDescContaCredito.text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzidoCredito.text+' AND COD_FILIAL = '+FloatToStr(1));
      MEContaCredito.text:=DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzidoCredito.text+' AND COD_FILIAL = '+FloatToStr(1));
    end
  else
    MEContaCreditoExit(Self);
end;

procedure TFCaixa_Lanc_Cont.MECodReduzidoDebitoExit(Sender: TObject);
begin
  if (Trim(MECodReduzidoDebito.text)<>'') and (Trim(MECodReduzidoDebito.text)<>'0')then
   begin
     MEDescContaDebito.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzidoDebito.Text+' AND COD_FILIAL = '+FloatToStr(1));
     MEContaDebito.Text:=DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzidoDebito.Text+' AND COD_FILIAL = '+FloatToStr(1));
   end
  else
    MeContaDebitoExit(Self);
  If MECodReduzidoCredito.Visible = True Then
     MeCodReduzidoCredito.SetFocus
  Else
     BitBtn1.SetFocus;
end;

procedure TFCaixa_Lanc_Cont.BitBtn1Click(Sender: TObject);
begin
  If (MeCodReduzidoDebito.Visible = True) And (MeContaDebito.Text = '') Then
     Raise Exception.Create ('Preenchimento Inválido Contas Contábeis'+chr(13)+Chr(10)+'Lançamento Não Efetuado');
  If (MeCodReduzidoCredito.Visible = True) And (MeContaCredito.Text = '') Then
     Raise Exception.Create ('Preenchimento Inválido Contas Contábeis'+chr(13)+Chr(10)+'Lançamento Não Efetuado');
  If (MeHistorico.Visible = True) And (MeHistorico.Text = '') Then
     Raise Exception.Create ('Preenchimento Inválido Histórico Contábil'+chr(13)+Chr(10)+'Lançamento Não Efetuado');
  ModalResult := MrOk;
end;

procedure TFCaixa_Lanc_Cont.SbConsHistoricoClick(Sender: TObject);
begin
  if FHistContabilCons = Nil then
    FHistContabilCons :=  TFHistContabilCons.Create(Application);
  if FHistContabilCons.ShowModal = mrOk then
    begin
      MeHistorico.text:=DMHistContabil.QHistContabilConsCod_Historico_Contabil.Text;
      MeHistoricoExit(Self);
    end;
end;

procedure TFCaixa_Lanc_Cont.MeHistoricoExit(Sender: TObject);
begin
  if (Trim(MeHistorico.text)<>'') and (Trim(MeHistorico.text)<>'0')then
     MeHistoricoDescricao.text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO_CONTABIL FROM TB_HISTORICO_CONTABIL','COD_HISTORICO_CONTABIL = '+MeHistorico.text);

end;

end.
