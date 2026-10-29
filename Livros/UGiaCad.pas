unit UGiaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBCGrids, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFGiaCad = class(TFTCadSimples)
    ScrollBox1: TScrollBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    GroupBox5: TGroupBox;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label10: TLabel;
    DBEdit13: TDBEdit;
    Label11: TLabel;
    DBEdit14: TDBEdit;
    GroupBox9: TGroupBox;
    Panel2: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Bevel1: TBevel;
    Panel3: TPanel;
    Bevel2: TBevel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label14: TLabel;
    DBEdit17: TDBEdit;
    Label13: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label12: TLabel;
    Label15: TLabel;
    Edit10: TEdit;
    DBEdit20: TDBEdit;
    Label16: TLabel;
    Edit11: TEdit;
    DBEdit21: TDBEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Edit13: TEdit;
    DBEdit23: TDBEdit;
    Edit12: TEdit;
    DBEdit22: TDBEdit;
    Label26: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    DBEdit29: TDBEdit;
    Edit20: TEdit;
    DBEdit30: TDBEdit;
    Edit21: TEdit;
    DBEdit31: TDBEdit;
    Edit22: TEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    DBEdit38: TDBEdit;
    Edit29: TEdit;
    DBEdit39: TDBEdit;
    Edit30: TEdit;
    DBEdit40: TDBEdit;
    Edit31: TEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    DBEdit47: TDBEdit;
    Edit38: TEdit;
    DBEdit48: TDBEdit;
    Edit39: TEdit;
    DBEdit49: TDBEdit;
    Edit40: TEdit;
    DBEdit50: TDBEdit;
    Edit37: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    Label4: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Edit41: TEdit;
    DBEdit51: TDBEdit;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Edit42: TEdit;
    DBEdit52: TDBEdit;
    Edit43: TEdit;
    DBEdit53: TDBEdit;
    Edit44: TEdit;
    DBEdit54: TDBEdit;
    Edit45: TEdit;
    DBEdit55: TDBEdit;
    Edit46: TEdit;
    DBEdit56: TDBEdit;
    Edit47: TEdit;
    DBEdit57: TDBEdit;
    Edit48: TEdit;
    DBEdit58: TDBEdit;
    Label42: TLabel;
    Label46: TLabel;
    Edit49: TEdit;
    DBEdit59: TDBEdit;
    Edit51: TEdit;
    DBEdit61: TDBEdit;
    GroupBox11: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Edit50: TEdit;
    DBEdit60: TDBEdit;
    Edit52: TEdit;
    DBEdit62: TDBEdit;
    Edit53: TEdit;
    DBEdit63: TDBEdit;
    Edit54: TEdit;
    DBEdit64: TDBEdit;
    Edit55: TEdit;
    DBEdit65: TDBEdit;
    Edit56: TEdit;
    DBEdit66: TDBEdit;
    Edit57: TEdit;
    DBEdit67: TDBEdit;
    Edit58: TEdit;
    DBEdit68: TDBEdit;
    Edit59: TEdit;
    DBEdit69: TDBEdit;
    Edit60: TEdit;
    DBEdit70: TDBEdit;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    DBEdit72: TDBEdit;
    DBEdit71: TDBEdit;
    Label60: TLabel;
    GroupBox12: TGroupBox;
    DBEdit73: TDBEdit;
    Label61: TLabel;
    DBEdit74: TDBEdit;
    Label62: TLabel;
    GIAICMS1: TMenuItem;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Opes1: TMenuItem;
    GerarArquivoMagntico1: TMenuItem;
    SaveDialog: TSaveDialog;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure GIAICMS1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GerarArquivoMagntico1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGiaCad: TFGiaCad;

implementation

uses UGia_cl, UGiaCons, URGia, Printers, ULivroFiscalParam, UFilial_cl,
  UBiblioteca, UUsuario_cl, UCadastro_cl;

{$R *.DFM}
{ Função remove mascara cgc/cpf e acrescenta zeros }
function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
var S : string;
    x : integer;
begin
  for x := 1 to length(wCgc1) do
      if wCgc1[x] in ['0','1','2','3','4','5','6','7','8','9'] then
         S := S + wCgc1[x];

  while Length(S) < Zeros do
        S := '0' + S;

Result := S;

end;

procedure TFGiaCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMGia do
    QGia.Open;
  Self.WindowState := wsMaximized;
end;

procedure TFGiaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FGiaCons = Nil then
     FGiaCons := TFGiaCons.Create(Application);
  if FGiaCons.ShowModal = mrOk Then
  with DMGia do
  begin
    QGia.Close;
    QGia.SetVariable('FILIAL',QGiaConsCod_Filial.Value);
    QGia.SetVariable('ANO',QGiaConsNum_Ano.Value);
    QGia.SetVariable('MES',QGiaConsNum_Mes.Value);
    QGia.Open;
  end;
end;

procedure TFGiaCad.GIAICMS1Click(Sender: TObject);
begin
  inherited;
  If FRGia = Nil Then
    FRGia := TFRGia.Create(Application);
  MessageDlg('ATENÇÃO: Para que a GIA possa ser impressa corretamente, é necessário'
            +Chr(13)+'que o driver esteja configurado para papel Customizado (210x310).'
            +Chr(13)+'Verifique isto Clicando em Iniciar/Configurações/Impressoras'
            +Chr(13)+'OBS: Reinicie o Sistema após efetuar a Configuração!',mtWarning,[mbOk],0);
  FRGia.QRPrimario.Preview;
end;

procedure TFGiaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(13);
end;

procedure TFGiaCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  With DMGia do
    QGia.Open;
  Action := CaFree;
  FGiaCad := Nil;
end;

procedure TFGiaCad.GerarArquivoMagntico1Click(Sender: TObject);
var
  S:String;
  F:TextFile;
  i:integer;
  wVal: array[1..57] of array[1..2] of String;
  wCont:integer;
  wTipoArquivo:String;
begin
  inherited;
  wCont:=0;
  If FLivroFiscalParam = nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[8].TabVisible := True;
  if FLivroFiscalParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME9CodFilial.Text),'LIVRO FISCAL');
    if (Trim(FLivroFiscalParam.ME9CodFilial.Text) <> '') and (Trim(FLivroFiscalParam.ME9Ano.Text) <> '')
       and (Trim(FLivroFiscalParam.ME9Mes.Text) <> '') then
    begin
      with DMGia do
      begin
        QGia.Close;
        QGia.SetVariable('FILIAL',Trim(FLivroFiscalParam.ME9CodFilial.Text));
        QGia.SetVariable('ANO',Trim(FLivroFiscalParam.ME9Ano.Text));
        QGia.SetVariable('MES',Trim(FLivroFiscalParam.ME9Mes.Text));
        QGia.Open;

        DMFilial.QFilial.Close;
        DMFilial.QFilial.Setvariable('PK',QGiaCod_Filial.Value);
        DMFilial.QFilial.Open;

        wVal[1,1]:='2';
        wVal[1,2]:=QGiaVal_02.Text;
        wVal[2,1]:='4';
        wVal[2,2]:=QGiaVal_04.Text;
        wVal[3,1]:='6';
        wVal[3,2]:=QGiaVal_06.Text;
        wVal[4,1]:='10';
        wVal[4,2]:=QGiaVal_10.Text;
        wVal[5,1]:='11';
        wVal[5,2]:=QGiaVal_11.Text;
        wVal[6,1]:='13';
        wVal[6,2]:=QGiaVal_13.Text;
        wVal[7,1]:='14';
        wVal[7,2]:=QGiaVal_14.Text;
        wVal[8,1]:='15';
        wVal[8,2]:=QGiaVal_15.Text;
        wVal[9,1]:='16';
        wVal[9,2]:=QGiaVal_16.Text;
        wVal[10,1]:='17';
        wVal[10,2]:=QGiaVal_17.Text;
        wVal[11,1]:='18';
        wVal[11,2]:=QGiaVal_18.Text;
        wVal[12,1]:='19';
        wVal[12,2]:=QGiaVal_19.Text;
        wVal[13,1]:='20';
        wVal[13,2]:=QGiaVal_20.Text;
        wVal[14,1]:='21';
        wVal[14,2]:=QGiaVal_21.Text;
        wVal[15,1]:='23';
        wVal[15,2]:=QGiaVal_23.Text;
        wVal[16,1]:='24';
        wVal[16,2]:=QGiaVal_24.Text;
        wVal[17,1]:='25';
        wVal[17,2]:=QGiaVal_25.Text;
        wVal[18,1]:='26';
        wVal[18,2]:=QGiaVal_26.Text;
        wVal[19,1]:='27';
        wVal[19,2]:=QGiaVal_27.Text;
        wVal[20,1]:='28';
        wVal[20,2]:=QGiaVal_28.Text;
        wVal[21,1]:='29';
        wVal[21,2]:=QGiaVal_29.Text;
        wVal[22,1]:='30';
        wVal[22,2]:=QGiaVal_30.Text;
        wVal[23,1]:='31';
        wVal[23,2]:=QGiaVal_31.Text;
        wVal[24,1]:='33';
        wVal[24,2]:=QGiaVal_33.Text;
        wVal[25,1]:='34';
        wVal[25,2]:=QGiaVal_34.Text;
        wVal[26,1]:='35';
        wVal[26,2]:=QGiaVal_35.Text;
        wVal[27,1]:='36';
        wVal[27,2]:=QGiaVal_36.Text;
        wVal[28,1]:='39';
        wVal[28,2]:=QGiaVal_39.Text;
        wVal[29,1]:='40';
        wVal[29,2]:=QGiaVal_40.Text;
        wVal[30,1]:='41';
        wVal[30,2]:=QGiaVal_41.Text;
        wVal[31,1]:='43';
        wVal[31,2]:=QGiaVal_43.Text;
        wVal[32,1]:='44';
        wVal[32,2]:=QGiaVal_44.Text;
        wVal[33,1]:='45';
        wVal[33,2]:=QGiaVal_45.Text;
        wVal[34,1]:='46';
        wVal[34,2]:=QGiaVal_46.Text;
        wVal[35,1]:='49';
        wVal[35,2]:=QGiaVal_49.Text;
        wVal[36,1]:='50';
        wVal[36,2]:=QGiaVal_50.Text;
        wVal[37,1]:='51';
        wVal[37,2]:=QGiaVal_51.Text;
        wVal[38,1]:='52';
        wVal[38,2]:=QGiaVal_52.Text;
        wVal[39,1]:='53';
        wVal[39,2]:=QGiaVal_53.Text;
        wVal[40,1]:='54';
        wVal[40,2]:=QGiaVal_54.Text;
        wVal[41,1]:='55';
        wVal[41,2]:=QGiaVal_55.Text;
        wVal[42,1]:='56';
        wVal[42,2]:=QGiaVal_56.Text;
        wVal[43,1]:='58';
        wVal[43,2]:=QGiaVal_58.Text;
        wVal[44,1]:='59';
        wVal[44,2]:=QGiaVal_59.Text;
        wVal[45,1]:='60';
        wVal[45,2]:=QGiaVal_60.Text;
        wVal[46,1]:='61';
        wVal[46,2]:=QGiaVal_61.Text;
        wVal[47,1]:='62';
        wVal[47,2]:=QGiaVal_62.Text;
        wVal[48,1]:='63';
        wVal[48,2]:=QGiaVal_63.Text;
        wVal[49,1]:='64';
        wVal[49,2]:=QGiaVal_64.Text;
        wVal[50,1]:='65';
        wVal[50,2]:=QGiaVal_65.Text;
        wVal[51,1]:='66';
        wVal[51,2]:=QGiaVal_66.Text;
        wVal[52,1]:='67';
        wVal[52,2]:=QGiaVal_67.Text;
        wVal[53,1]:='68';
        wVal[53,2]:=QGiaVal_68.Text;
        wVal[54,1]:='69';
        wVal[54,2]:=QGiaVal_69.Text;
        wVal[55,1]:='70';
        wVal[55,2]:=QGiaVal_70.Text;
        wVal[56,1]:='80';
        wVal[56,2]:=QGiaVal_80.Text;
        wVal[57,1]:='90';
        wVal[57,2]:=QGiaVal_90.Text;
        for i:=1 to 57 do   // ---laço que conta o numero de registros a serem gravados
        begin               // -- serao gravados apenas os registros q tenham valor <> de zero
          if wVal[i,2] <> '0.00' then
            inc(wCont);
        end;

        if FLivroFiscalParam.RGTipoArquivo.ItemIndex = 0 then
          wTipoArquivo:='43'
        else
          wTipoArquivo:='51';

        S:= '';  // Inicializa valor da variavel.
        S:=S+'1'                                                                                     +
        RMaskCGC_CPF(DMFilial.QFilialDesc_Inscricao.Value,10)                                        +
        Bib.FormataTexto(Trim(FLivroFiscalParam.ME9Ano.Text)+Bib.FormataTexto(Trim(FLivroFiscalParam.ME9Mes.Text),2),6)  +
        wTipoArquivo                                                                                 +
        Bib.FormataTexto(QGiaNUM_CRC_CONTADOR.Value,10)                                              +
        RMaskCGC_CPF(QGiaVAL_Q06.Text,15)                                                            +
        RMaskCGC_CPF(QGiaVAL_Q07_NUM_FUNC.Text,5)                                                    +
        RMaskCGC_CPF(QGiaVAL_Q07_FOLHA.Text,15)                                                      +
        RMaskCGC_CPF(IntToStr(wCont),2);
        S:= S+Chr(13)+Chr(10);  // fim da gravacao do cabeçalho do arquivo

        for i:=1 to 57 do
        begin
          if wVal[i,2] <> '0.00' then
          begin
            S:= S+'2'                                                                                    +
            RMaskCGC_CPF(DMFilial.QFilialDesc_Inscricao.Value,10)                                        +
            Bib.FormataTexto(Trim(FLivroFiscalParam.ME9Ano.Text)+Trim(FLivroFiscalParam.ME9Mes.Text),6)  +
            wTipoArquivo                                                                                 +
            RMaskCGC_CPF(wVal[i,1],2)                                                        +
            RMaskCGC_CPF(wVal[i,2],15)                                                       ;
            S:= S+Chr(13)+Chr(10);
          end;
        end;
     end;
     if FGiaCad.SaveDialog.Execute then
     begin
       AssignFile(F, FGiaCad.SaveDialog.FileName);
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
       MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
     end
     else
       MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
    end
    else
      showmessage('Os campos Filial, Mês e Ano devem ser Preenchidos!!');
  end;
end;
procedure TFGiaCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMGia.QGiaCOD_FILIAL.Text),'LIVRO FISCAL');
  If DMFilial.QFilialCOD_CADASTRO_CONTABILISTA.Text <> '' Then
  Begin
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('Pk',DMFilial.QFilialCOD_CADASTRO_CONTABILISTA.Value);
    DMCadastro.QCadastro.Open;
    DMGia.QGiaNUM_CRC_CONTADOR.Value := DMCadastro.QCadastroDesc_CRC.Value;
    DMGia.QGiaNOME_CONTADOR.Value := DMCadastro.QCadastroNome.Value;
    DMCadastro.QCadastro.Close;
  End;
  inherited;
end;

end.
