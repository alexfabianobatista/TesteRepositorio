unit URTermoReconhecimentoRisco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFRTermoReconhecimentoRisco = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel5: TQRLabel;
    QRMDeclaracaoUsuario: TQRMemo;
    QRLabel6: TQRLabel;
    QRMDeclaracaoUsuario1: TQRMemo;
    QRLLocal: TQRLabel;
    QRLabel7: TQRLabel;
    QRHRule1: TQRHRule;
    QRLabel8: TQRLabel;
    QRLNomeAgronomo: TQRLabel;
    QRLCrea: TQRLabel;
    QRLReceituario: TQRLabel;
    QRLArt: TQRLabel;
    QRLLocalAgronomo: TQRLabel;
    QRLabel9: TQRLabel;
    QRHRule2: TQRHRule;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    wNomeCadastro: string;
    wEnderecoCadastro: string;
    wRgCadastro: string;
    wOrgaoEmissorCadastro: string;
    wCpfCadastro: string;
    wInscMunicipalCadastro: string;
    wLocalCadastro: string;
    wNomeAgronomo: string;
    wCreaAgronomo: string;
    wReceituario: string;
    wArtAgronomo: string;
    wLocalAgronomo: string;

  public
    { Public declarations }
    property NomeCadastro: string read wNomeCadastro write wNomeCadastro;
    property EnderecoCadastro: string read wEnderecoCadastro write wEnderecoCadastro;
    property RgCadastro: string read wRgCadastro write wRgCadastro;
    property OrgaoEmissorCadastro: string read wOrgaoEmissorCadastro write wOrgaoEmissorCadastro;
    property CpfCadastro: string read wCpfCadastro write wCpfCadastro;
    property InscMunicipalCadastro: string read wInscMunicipalCadastro write wInscMunicipalCadastro;
    property LocalCadastro: string read wLocalCadastro write wLocalCadastro;
    property NomeAgronomo: string read wNomeAgronomo write wNomeAgronomo;
    property CreaAgronomo: string read wCreaAgronomo write wCreaAgronomo;
    property Receituario: string read wReceituario write wReceituario;
    property ArtAgronomo: string read wArtAgronomo write wArtAgronomo;
    property LocalAgronomo: string read wLocalAgronomo write wLocalAgronomo;
  end;

var
  FRTermoReconhecimentoRisco: TFRTermoReconhecimentoRisco;

implementation

uses UBiblioteca, UOracle_cl, UCadastro_cl;

{$R *.dfm}

procedure TFRTermoReconhecimentoRisco.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRMDeclaracaoUsuario.Lines.Add(
    'Declaração do usuário: Eu, ' + nomeCadastro + ','
  );
  QRMDeclaracaoUsuario1.Lines.Add('Endereço ' + enderecoCadastro);
  if RgCadastro <> '' then
    QRMDeclaracaoUsuario1.Lines.Add('Identidade número ' + rgCadastro
      + ', Órgão Emissor ' + orgaoEmissorCadastro)
  else
    QRMDeclaracaoUsuario1.Lines.Add('Identidade número __________________________'
      + ', Órgão Emissor __________________________________,');
  if CpfCadastro <> '' then
    QRMDeclaracaoUsuario1.Lines.Add(
      'CPF ' + cpfCadastro
      + ', CADPRO ' + inscMunicipalCadastro)
  else
    QRMDeclaracaoUsuario1.Lines.Add(
      'CPF __________________________,' 
      + ', CADPRO ' + inscMunicipalCadastro);
  QRLLocal.Caption := 'Local: ' + localCadastro
    + ' Data: ' + DateToStr(DMOracle.DataServ);
  QRLNomeAgronomo.Caption := 'Nome: ' + nomeAgronomo;
  QRLCrea.Caption := 'Nº inscrição CREA: ' + creaAgronomo;
  QRLReceituario.Caption := 'Nº Receituário: ' + receituario;
  QRLArt.Caption := 'Nº ART: ' + artAgronomo;
  QRLLocalAgronomo.Caption := 'Local: ' + localAgronomo
    + ', Data: ' + DateToStr(DMOracle.DataServ);   
end;

end.
